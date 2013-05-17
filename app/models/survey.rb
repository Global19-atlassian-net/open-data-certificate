class Survey < ActiveRecord::Base
  include Surveyor::Models::SurveyMethods

  REQUIREMENT_LEVELS = %w(none basic pilot standard exemplar)

  validate :ensure_requirements_are_linked_to_only_one_question_or_answer
  validates :dataset_title, :presence => true
  attr_accessible :dataset_title

  class << self
    def available_to_complete
      #order('title DESC, survey_version DESC').select(&:active?).group_by(&:access_code).map{|k,v| v.first} # TODO: all the surveys need to be set to be activated in the DB to use this line - though for live it will (probably) be wanted
      order('title DESC, survey_version DESC').group_by(&:access_code).map{|k,v| v.first}
    end
  end

  def questions
    @questions ||= Question.where(['questions.survey_section_id in (?)', (sections.map(&:id)<<0)])
  end

  def requirements
    @requirements ||= questions.select(&:is_a_requirement?)
  end

  def only_questions
    @only_questions ||= (questions - requirements)
  end

  def mandatory_questions
    @mandatory_questions ||= sections.map{|s| s.questions.where(:is_mandatory => true)}.flatten
  end

  def valid?(context = nil)
    super(context)
    unless errors.empty?

      sections.each do |section|
        unless section.errors.empty?
          puts "section '#{section.title}' errors: #{section.errors.full_messages}"

          questions.each do |question|
            unless question.errors.empty?
              puts "question '#{question.text}' errors: #{question.errors.full_messages}"

              question.answers.each do |answer|
                puts "answer '#{answer.text}' errors: #{answer.errors.full_messages}" unless answer.errors.empty?
              end

            end
          end

        end
      end

    end

    return errors.empty?
  end

  private
  def ensure_requirements_are_linked_to_only_one_question_or_answer
    # can't rely on the methods for these collections, as for new surveys nothing will be persisted to DB yet
    questions = sections.map(&:questions).flatten.compact
    requirements = questions.select(&:is_a_requirement?)
    only_questions = (questions - requirements)
    answers = only_questions.map(&:answers).flatten.compact

    requirements.each do |requirement|
      amount = only_questions.select { |q| q != requirement && q.requirement == requirement.requirement }.count + answers.select { |a| a.requirement == requirement.requirement}.count
      if amount > 1
        errors.add(:base, "requirement '#{requirement.reference_identifier}' is linked to more than one question or answer")
      end
    end
  end


end
