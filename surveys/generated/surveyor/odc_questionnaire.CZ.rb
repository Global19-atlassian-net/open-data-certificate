survey 'CZ',
  :full_title => 'Czech Republic',
  :status => 'beta',
  :description => '<p>This self-assessment questionnaire generates an open data certificate and badge you can publish to tell people all about this open data. We also use your answers to learn how organisations publish open data.</p><p>When you answer these questions it demonstrates your efforts to comply with relevant legislation. You should also check which other laws and policies apply to your sector.</p><p><strong>You do not need to answer all the questions to get a certificate.</strong> Just answer those you can.</p>' do

  section_general 'General Information',
    :description => '',
    :display_header => false do

    q_dataTitle 'What\'s this data called?',
      :discussion_topic => :dataTitle,
      :help_text => 'People see the name of your open data in a list of similar ones so make this as unambiguous and descriptive as you can in this tiny box so they quickly identify what\'s unique about it.',
      :required => :required
    a_1 'Data Title',
      :string,
      :placeholder => 'Data Title'

    q_documentationUrl 'Where is it described?',
      :discussion_topic => :documentationUrl,
      :display_on_certificate => true,
      :text_as_statement => 'This data is described at',
      :help_text => 'Give a URL for people to read about the contents of your open data and find more detail. It can be a page within a bigger catalog like data.gov.uk.'
    a_1 'Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Documentation URL',
      :corresponding_requirements => ['pilot_1', 'basic_1']

    label_pilot_1 'You should have a <strong>web page that offers documentation</strong> about the open data you publish so that people can understand its context, content and utility.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '!=', :a_collection
    condition_B :q_documentationUrl, '==', {:string_value => '', :answer_reference => '1'}

    label_basic_1 'You must have a <strong>web page that gives documentation</strong> and access to the open data you publish so that people can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_collection
    condition_B :q_documentationUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_publisher 'Who publishes this data?',
      :discussion_topic => :publisher,
      :display_on_certificate => true,
      :text_as_statement => 'This data is published by',
      :help_text => 'Give the name of the organisation who publishes this data. It’s probably who you work for unless you’re doing this on behalf of someone else.',
      :required => :required
    a_1 'Data Publisher',
      :string,
      :placeholder => 'Data Publisher'

    q_publisherUrl 'What website is the data published on?',
      :discussion_topic => :publisherUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The data is published on',
      :help_text => 'Give a URL to a website, this helps us to group data from the same organisation even if people give different names.'
    a_1 'Publisher URL',
      :text,
      :input_type => :url,
      :placeholder => 'Publisher URL'

    q_releaseType 'What kind of release is this?',
      :discussion_topic => :releaseType,
      :pick => :one,
      :required => :required
    a_oneoff 'a one-off release of a single dataset',
      :help_text => 'This is a single file and you don’t currently plan to publish similar files in the future.'
    a_collection 'a one-off release of a set of related datasets',
      :help_text => 'This is a collection of related files about the same data and you don’t currently plan to publish similar collections in the future.'
    a_series 'ongoing release of a series of related datasets',
      :help_text => 'This is a sequence of datasets with planned periodic updates in the future.'
    a_service 'a service or API for accessing open data',
      :help_text => 'This is a live web service that exposes your data to programmers through an interface they can query.'

  end

  section_legal 'Legal Information',
    :description => 'Rights, licensing and privacy' do

    label_ownership 'Rights',
      :help_text => 'your right to share this data with people'

    q_publisherRights 'Do you have the right to make this data open?',
      :discussion_topic => :cz_publisherRights,
      :help_text => 'If your organisation did not originally create or gather this data then you may not have the right to publish it as open data. If you are not sure, please check with the data owner for their permission.
				<br/>
				Open data is data that anyone can access, use and share – subject only, at most, to the requirement to attribute and share-alike – see our page explaining ‘<a href="https://theodi.org/what-is-open-data">what is open data?</a>’ and the <a href="http://opendefinition.org">open definition</a> for more details.',
      :corresponding_requirements => ['basic_2'],
      :pick => :one,
      :required => :required
    a_yes 'yes, you have the rights to open this data up',
      :corresponding_requirements => ['standard_1']
    a_no 'no, you don’t have the rights to open up this data'
    a_unsure 'you’re not sure if you have the rights to publish this data as open data'
    a_complicated 'the rights in this data are complicated or unclear'

    label_standard_1 'You should have a <strong>clear legal right to publish this data</strong>.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_publisherRights, '!=', :a_yes

    label_basic_2 'You must have the <strong>right to publish this data</strong>.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_publisherRights, '==', :a_no

    q_rightsRiskAssessment 'Where do you detail the risks people might encounter if they use this data?',
      :discussion_topic => :cz_rightsRiskAssessment,
      :display_on_certificate => true,
      :text_as_statement => 'Risks in using this data are described at',
      :help_text => 'It can be risky for people to use data without a clear legal right to do so. For example, the data might be taken down in response to a legal challenge. Give a URL for a page that describes the risk of using this data.'
    dependency :rule => 'A'
    condition_A :q_publisherRights, '==', :a_complicated
    a_1 'Risk Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Risk Documentation URL',
      :corresponding_requirements => ['pilot_2']

    label_pilot_2 'You should document <strong>risks associated with using this data</strong>, so people can work out how they want to use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_publisherRights, '==', :a_complicated
    condition_B :q_rightsRiskAssessment, '==', {:string_value => '', :answer_reference => '1'}

    q_publisherOrigin 'Was the data originally created or generated by you?',
      :discussion_topic => :cz_publisherOrigin,
      :display_on_certificate => true,
      :text_as_statement => 'This data was',
      :help_text => 'If any part of this data was sourced outside your organisation by other individuals or organisations then you need to give extra information about your right to publish it.',
      :pick => :one
    dependency :rule => '(A or B)'
    condition_A :q_publisherRights, '==', :a_yes
    condition_B :q_publisherRights, '==', :a_unsure
    a_true 'yes',
      :text_as_statement => 'originally created or generated by its curator'
    a_false 'no, it uses external sources',
      :text_as_statement => ''

    q_thirdPartyOrigin 'Was some of this data extracted or calculated from other data?',
      :discussion_topic => :cz_thirdPartyOrigin,
      :help_text => 'An extract or smaller part of someone else\'s data still means your rights to use it might be affected. There might also be legal issues if you analysed their data to produce new results from it.',
      :pick => :one,
      :required => :required
    dependency :rule => 'A and B'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['basic_3']

    label_basic_3 'You indicated that this data wasn\'t originally created or gathered by you, and wasn\'t crowdsourced, so it must have been extracted or calculated from other data sources.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_crowdsourced, '==', :a_false
    condition_D :q_thirdPartyOrigin, '!=', :a_true

    q_thirdPartyOpen 'Are <em>all</em> sources of this data already published as open data?',
      :discussion_topic => :cz_thirdPartyOpen,
      :display_on_certificate => true,
      :text_as_statement => 'This data is created from',
      :help_text => 'You\'re allowed to republish someone else\'s data if it\'s already under an open data licence or if their rights have expired or been waived. If any part of this data is not like this then you\'ll need legal advice before you can publish it.',
      :pick => :one,
      :required => :required
    dependency :rule => 'A and B and C'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_thirdPartyOrigin, '==', :a_true
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'open data sources',
      :corresponding_requirements => ['basic_4']

    label_basic_4 'You should get <strong>legal advice to make sure you have the right to publish this data</strong>.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D and E'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_thirdPartyOrigin, '==', :a_true
    condition_D :q_thirdPartyOpen, '==', :a_false
    condition_E :q_thirdPartyOpen, '==', :a_false

    q_crowdsourced 'Was some of this data crowdsourced?',
      :discussion_topic => :cz_crowdsourced,
      :display_on_certificate => true,
      :text_as_statement => 'Some of this data is',
      :help_text => 'If the data includes information contributed by people outside your organisation, you need their permission to publish their contributions as open data.',
      :pick => :one,
      :required => :required
    dependency :rule => 'A and B'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'crowdsourced',
      :corresponding_requirements => ['basic_5']

    label_basic_5 'You indicated that the data wasn\'t originally created or gathered by you, and wasn\'t extracted or calculated from other data, so it must have been crowdsourced.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_thirdPartyOrigin, '==', :a_false
    condition_D :q_crowdsourced, '!=', :a_true

    q_crowdsourcedContent 'Did contributors to this data use their judgement?',
      :discussion_topic => :cz_crowdsourcedContent,
      :help_text => 'If people used their creativity or judgement to contribute data then they have copyright over their work. For example, writing a description or deciding whether or not to include some data in a dataset would require judgement. So contributors must transfer or waive their rights, or license the data to you before you can publish it.',
      :pick => :one,
      :required => :required
    dependency :rule => 'A and B and C'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_crowdsourced, '==', :a_true
    a_false 'no'
    a_true 'yes'

    q_claUrl 'Where is the Contributor Licence Agreement (CLA)?',
      :discussion_topic => :cz_claUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The Contributor Licence Agreement is at',
      :help_text => 'Give a link to an agreement that shows contributors allow you to reuse their data. A CLA will either transfer contributor\'s rights to you, waive their rights, or license the data to you so you can publish it.',
      :help_text_more_url => 'http://en.wikipedia.org/wiki/Contributor_License_Agreement',
      :required => :required
    dependency :rule => 'A and B and C and D'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_crowdsourced, '==', :a_true
    condition_D :q_crowdsourcedContent, '==', :a_true
    a_1 'Contributor Licence Agreement URL',
      :text,
      :input_type => :url,
      :placeholder => 'Contributor Licence Agreement URL'

    q_cldsRecorded 'Have all contributors agreed to the Contributor Licence Agreement (CLA)?',
      :discussion_topic => :cz_cldsRecorded,
      :help_text => 'Check all contributors agree to a CLA before you reuse or republish their contributions. You should keep a record of who gave contributions and whether or not they agree to the CLA.',
      :pick => :one,
      :required => :required
    dependency :rule => 'A and B and C and D'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_crowdsourced, '==', :a_true
    condition_D :q_crowdsourcedContent, '==', :a_true
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['basic_6']

    label_basic_6 'You must get <strong>contributors to agree to a Contributor Licence Agreement</strong> (CLA) that gives you the right to publish their work as open data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D and E'
    condition_A :q_publisherRights, '==', :a_unsure
    condition_B :q_publisherOrigin, '==', :a_false
    condition_C :q_crowdsourced, '==', :a_true
    condition_D :q_crowdsourcedContent, '==', :a_true
    condition_E :q_cldsRecorded, '==', :a_false

    q_sourceDocumentationUrl 'Where do you describe sources of this data?',
      :discussion_topic => :cz_sourceDocumentationUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The sources of this data are described at',
      :help_text => 'Give a URL that documents where the data was sourced from (its provenance) and the rights under which you publish the data. This helps people understand where the data comes from.'
    dependency :rule => 'A'
    condition_A :q_publisherOrigin, '==', :a_false
    a_1 'Data Sources Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Data Sources Documentation URL',
      :corresponding_requirements => ['pilot_3']

    label_pilot_3 'You should document <strong>where the data came from and the rights under which you publish it</strong>, so people are assured they can use parts which came from third parties.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_publisherOrigin, '==', :a_false
    condition_B :q_sourceDocumentationUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_sourceDocumentationMetadata 'Is documentation about the sources of this data also in machine-readable format?',
      :discussion_topic => :cz_sourceDocumentationMetadata,
      :display_on_certificate => true,
      :text_as_statement => 'The curator has published',
      :help_text => 'Information about data sources should be human-readable so people can understand it, as well as in a metadata format that computers can process. When everyone does this it helps other people find out how the same open data is being used and justify its ongoing publication.',
      :pick => :one
    dependency :rule => 'A and B'
    condition_A :q_publisherOrigin, '==', :a_false
    condition_B :q_sourceDocumentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'machine-readable data about the sources of this data',
      :corresponding_requirements => ['standard_2']

    label_standard_2 'You should <strong>include machine-readable data about the sources of this data</strong>.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_publisherOrigin, '==', :a_false
    condition_B :q_sourceDocumentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_C :q_sourceDocumentationMetadata, '==', :a_false

    label_licensing 'Licensing',
      :help_text => 'how you give people permission to use this data'

    q_copyrightURL 'Where have you published the rights statement for this dataset?',
      :discussion_topic => :cz_copyrightURL,
      :display_on_certificate => true,
      :text_as_statement => 'The rights statement is at',
      :help_text => 'Give the URL to a page that describes the right to re-use this dataset. This should include a reference to its license, attribution requirements, and a statement about relevant copyright and database rights. A rights statement helps people understand what they can and can\'t do with the data.'
    a_1 'Rights Statement URL',
      :text,
      :input_type => :url,
      :placeholder => 'Rights Statement URL',
      :corresponding_requirements => ['pilot_4']

    label_pilot_4 'You should <strong>publish a rights statement</strong> that details copyright, database rights, licensing and how people should give attribution to the data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_copyrightURL, '==', {:string_value => '', :answer_reference => '1'}

    q_databaseRights 'Do database rights apply to your dataset?',
      :discussion_topic => :cz_databaseRights,
      :display_on_certificate => true,
      :text_as_statement => 'Database rights to the dataset',
      :help_text => 'In the Czech law system, each dataset can be considered from two viewpoints,
				as a database and as a creative work. In this question we consider the first case:
				each database that was creating using non-trivial effort is protected by database
				rights.',
      :pick => :one
    a_false 'no',
      :text_as_statement => 'not applicable'
    a_true 'yes',
      :text_as_statement => 'apply'

    q_databaseRightsLicenseType 'How are the database rights to your dataset licensed?',
      :discussion_topic => :cz_databaseRightsLicenseType,
      :display_on_certificate => true,
      :text_as_statement => 'Database rights licensing',
      :help_text => 'If you want to publish your dataset as open data, you must have an open license
					to its database rights.',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseRights, '==', :a_true
    a_cc_by 'Creative Commons 3.0 Attribution',
      :text_as_statement => 'Creative Commons 3.0 Attribution'
    a_cc_by_sa 'Creative Commons 3.0 Attribution-ShareAlike',
      :text_as_statement => 'Creative Commons 3.0 Attribution-ShareAlike'
    a_cc_by_4 'Creative Commons 4.0 Attribution',
      :text_as_statement => 'Creative Commons 4.0 Attribution'
    a_cc_by_sa_4 'Creative Commons 4.0 Attribution-ShareAlike',
      :text_as_statement => 'Creative Commons 4.0 Attribution-ShareAlike'
    a_cc_zero 'Creative Commons CC0',
      :text_as_statement => 'Creative Commons CC0'
    a_odc_by 'Open Data Commons Attribution License',
      :text_as_statement => 'Open Data Commons Attribution License'
    a_odc_odbl 'Open Data Commons Open Database License (ODbL)',
      :text_as_statement => 'Open Data Commons Open Database License (ODbL)'
    a_odc_pddl 'Open Data Commons Public Domain Dedication and License (PDDL)',
      :text_as_statement => 'Open Data Commons Public Domain Dedication and License (PDDL)'
    a_other 'other…',
      :text_as_statement => ''

    q_databaseRightsURL 'Where do you describe the licensing terms for the database rights?',
      :discussion_topic => :cz_databaseRightsURL,
      :display_on_certificate => true,
      :text_as_statement => 'Database rights license',
      :required => :required
    dependency :rule => 'A'
    condition_A :q_databaseRightsLicenseType, '==', :a_other
    a_1 'license URL',
      :text,
      :input_type => :url,
      :placeholder => 'license URL'

    q_databaseRightsNAReason 'Why there are no database rights to the dataset?',
      :discussion_topic => :cz_databaseRightsNAReason,
      :display_on_certificate => true,
      :text_as_statement => 'Database rights do not apply because',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseRights, '==', :a_false
    a_trivial '
								Non-trivial effort wasn’t needed to create the dataset.',
      :text_as_statement => 'creating the dataset was trivial'
    a_expired '
								The database rights expired.',
      :text_as_statement => 'the rights expired'
    a_waived '
								The rights were waived by their holders.',
      :text_as_statement => 'the rights were waived'

    q_databaseRightsWaiveType 'How were the database rights waived?',
      :discussion_topic => :cz_databaseRightsWaiveType,
      :display_on_certificate => true,
      :text_as_statement => 'The database rights were waived through',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseRightsNAReason, '==', :a_waived
    a_cc_zero 'Creative Commons CC0',
      :text_as_statement => 'Creative Commons CC0'
    a_odc_pddl 'Open Data Commons Public Domain Dedication and License (PDDL)',
      :text_as_statement => 'Open Data Commons Public Domain Dedication and License (PDDL)'
    a_other 'other…',
      :text_as_statement => ''

    q_databaseRightsWaiverURL 'Where is the document used to waive the database rights?',
      :discussion_topic => :cz_databaseRightsWaiverURL,
      :display_on_certificate => true,
      :text_as_statement => 'Database rights waiver',
      :required => :required
    dependency :rule => 'A'
    condition_A :q_databaseRightsWaiveType, '==', :a_other
    a_1 'waiver URL',
      :text,
      :input_type => :url,
      :placeholder => 'waiver URL'

    q_databaseCopyright 'Does copyright apply to the dataset itself?',
      :discussion_topic => :cz_databaseCopyright,
      :display_on_certificate => true,
      :text_as_statement => 'Copyright to the dataset itself',
      :help_text => 'The dataset can also be protected by copyright. There are two parts that can be
					copyrighted: the dataset itself and the contents of the dataset. This question is interested
					in the first case, the copyright protection of the dataset itself as a creative work.',
      :pick => :one
    a_false 'no',
      :text_as_statement => 'none'
    a_true 'yes',
      :text_as_statement => 'applies'

    q_databaseCopyrightNAReason 'Why doesn’t copyright apply to the dataset itself?',
      :discussion_topic => :cz_databaseCopyrightNAReason,
      :display_on_certificate => true,
      :text_as_statement => 'The dataset itself is not copyrighted because',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseCopyright, '==', :a_false
    a_expired '
								The copyright has expired.',
      :text_as_statement => 'the copyright has expired'
    a_freeWork '
								The dataset is public domain.',
      :text_as_statement => 'the dataset is public domain'
    a_stateWork '
								The dataset is a government work.',
      :text_as_statement => 'the dataset is a government work'

    q_databaseCopyrightLicenseType 'How is the copyright to the dataset itself licensed?',
      :discussion_topic => :cz_databaseCopyrightLicenseType,
      :display_on_certificate => true,
      :text_as_statement => 'Dataset copyright license',
      :help_text => 'If you want to publish the dataset as open data, you must have
					an open license to its copyright.',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseCopyright, '==', :a_true
    a_cc_by 'Creative Commons 3.0 Attribution',
      :text_as_statement => 'Creative Commons 3.0 Attribution'
    a_cc_by_sa 'Creative Commons 3.0 Attribution-ShareAlike',
      :text_as_statement => 'Creative Commons 3.0 Attribution-ShareAlike'
    a_cc_by_4 'Creative Commons 4.0 Attribution',
      :text_as_statement => 'Creative Commons 4.0 Attribution'
    a_cc_by_sa_4 'Creative Commons 4.0 Attribution-ShareAlike',
      :text_as_statement => 'Creative Commons 4.0 Attribution-ShareAlike'
    a_cc_zero 'Creative Commons CC0',
      :text_as_statement => 'Creative Commons CC0'
    a_other 'other…',
      :text_as_statement => ''

    q_databaseCopyrightURL 'Where do you describe the dataset copyright licensing terms?',
      :discussion_topic => :cz_databaseCopyrightURL,
      :display_on_certificate => true,
      :text_as_statement => 'Dataset copyright license',
      :required => :required
    dependency :rule => 'A'
    condition_A :q_databaseCopyrightLicenseType, '==', :a_other
    a_1 'license URL',
      :text,
      :input_type => :url,
      :placeholder => 'license URL'

    q_databaseContentCopyright 'Does copyright apply to the contents of your dataset?',
      :discussion_topic => :cz_databaseContentCopyright,
      :display_on_certificate => true,
      :text_as_statement => 'Dataset contents copyright',
      :help_text => 'After the database rights and copyright to the dataset itself we are interested
					in the third kind of rights that may protect the dataset: copyright to the contents of
					your dataset.',
      :pick => :one
    a_false 'no',
      :text_as_statement => 'none'
    a_true 'yes',
      :text_as_statement => 'applies'

    q_databaseContentCopyrightNAReason 'Why is there no copyright to the contents of your dataset?',
      :discussion_topic => :cz_databaseContentCopyrightNAReason,
      :display_on_certificate => true,
      :text_as_statement => 'The dataset contents are not copyrighted because',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseContentCopyright, '==', :a_false
    a_notApplicable '
								Copyright does not apply to this kind of content.',
      :text_as_statement => 'copyright does not apply to this kind of content'
    a_expired '
								The copyright has expired.',
      :text_as_statement => 'the copyright has expired'
    a_freeWork '
								The dataset contents are public domain.',
      :text_as_statement => 'the contents are public domain'
    a_stateWork '
								The dataset contents are a government work.',
      :text_as_statement => 'the contents are a government work'

    q_databaseContentCopyrightLicenseType 'How is the copyright to the dataset contents licensed?',
      :discussion_topic => :cz_databaseContentCopyrightLicenseType,
      :display_on_certificate => true,
      :text_as_statement => 'Dataset contents copyright license',
      :pick => :one,
      :required => :required,
      :display_type => 'dropdown'
    dependency :rule => 'A'
    condition_A :q_databaseCopyright, '==', :a_true
    a_cc_by 'Creative Commons 3.0 Attribution',
      :text_as_statement => 'Creative Commons 3.0 Attribution'
    a_cc_by_sa 'Creative Commons 3.0 Attribution-ShareAlike',
      :text_as_statement => 'Creative Commons 3.0 Attribution-ShareAlike'
    a_cc_by_4 'Creative Commons 4.0 Attribution',
      :text_as_statement => 'Creative Commons 4.0 Attribution'
    a_cc_by_sa_4 'Creative Commons 4.0 Attribution-ShareAlike',
      :text_as_statement => 'Creative Commons 4.0 Attribution-ShareAlike'
    a_cc_zero 'Creative Commons CC0',
      :text_as_statement => 'Creative Commons CC0'
    a_other 'other…',
      :text_as_statement => ''

    q_databaseContentCopyrightURL 'Where do you describe the licensing terms for the copyright to the dataset contents?',
      :discussion_topic => :cz_databaseContentCopyrightURL,
      :display_on_certificate => true,
      :text_as_statement => 'Dataset contents copyright license',
      :required => :required
    dependency :rule => 'A'
    condition_A :q_databaseContentCopyrightLicenseType, '==', :a_other
    a_1 'license URL',
      :text,
      :input_type => :url,
      :placeholder => 'license URL'

    q_copyrightStatementMetadata 'Does your rights statement include machine-readable versions of',
      :discussion_topic => :cz_copyrightStatementMetadata,
      :display_on_certificate => true,
      :text_as_statement => 'The rights statement includes data about',
      :help_text => 'It\'s good practice to embed information about rights in machine-readable formats so people can automatically attribute this data back to you when they use it.',
      :help_text_more_url => 'https://github.com/theodi/open-data-licensing/blob/master/guides/publisher-guide.md',
      :pick => :any
    dependency :rule => 'A'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    a_dataLicense 'data licence',
      :text_as_statement => 'its data licence',
      :corresponding_requirements => ['standard_3']
    a_contentLicense 'content licence',
      :text_as_statement => 'its content licence',
      :corresponding_requirements => ['standard_4']
    a_attribution 'attribution text',
      :text_as_statement => 'what attribution text to use',
      :corresponding_requirements => ['standard_5']
    a_attributionURL 'attribution URL',
      :text_as_statement => 'what attribution link to give',
      :corresponding_requirements => ['standard_6']
    a_copyrightNotice 'copyright notice or statement',
      :text_as_statement => 'a copyright notice or statement',
      :corresponding_requirements => ['exemplar_1']
    a_copyrightYear 'copyright year',
      :text_as_statement => 'the copyright year',
      :corresponding_requirements => ['exemplar_2']
    a_copyrightHolder 'copyright holder',
      :text_as_statement => 'the copyright holder',
      :corresponding_requirements => ['exemplar_3']
    a_databaseRightYear 'database right year',
      :text_as_statement => 'the database right year',
      :corresponding_requirements => ['exemplar_4']
    a_databaseRightHolder 'database right holder',
      :text_as_statement => 'the database right holder',
      :corresponding_requirements => ['exemplar_5']

    label_standard_3 'You should provide <strong>machine-readable data in your rights statement about the licence</strong> for this data, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_dataLicense

    label_standard_4 'You should provide <strong>machine-readable data in your rights statement about the licence for the content</strong> of this data, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_contentLicense

    label_standard_5 'You should provide <strong>machine-readable data in your rights statement about the text to use when citing the data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_attribution

    label_standard_6 'You should provide <strong>machine-readable data in your rights statement about the URL to link to when citing this data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_attributionURL

    label_exemplar_1 'You should provide <strong>machine-readable data in your rights statement about the copyright statement or notice of this data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_copyrightNotice

    label_exemplar_2 'You should provide <strong>machine-readable data in your rights statement about the copyright year for the data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_copyrightYear

    label_exemplar_3 'You should provide <strong>machine-readable data in your rights statement about the copyright holder for the data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_copyrightHolder

    label_exemplar_4 'You should provide <strong>machine-readable data in your rights statement about the database right year for the data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_databaseRightYear

    label_exemplar_5 'You should provide <strong>machine-readable data in your rights statement about the database right holder for the data</strong>, so automatic tools can use it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_copyrightURL, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_copyrightStatementMetadata, '!=', :a_databaseRightHolder

    label_privacy 'Privacy',
      :help_text => 'how you protect people\'s privacy'

    q_dataPersonal 'Can individuals be identified from this data?',
      :discussion_topic => :cz_dataPersonal,
      :display_on_certificate => true,
      :text_as_statement => 'This data contains',
      :pick => :one,
      :required => :pilot
    a_not_personal 'no, the data is not about people or their activities',
      :text_as_statement => 'no data about individuals',
      :help_text => 'Remember that individuals can still be identified even if data isn\'t directly about them. For example, road traffic flow data combined with an individual\'s commuting patterns could reveal information about that person.'
    a_summarised 'no, the data has been anonymised by aggregating individuals into groups, so they can\'t be distinguished from other people in the group',
      :text_as_statement => 'aggregated data',
      :help_text => 'Statistical disclosure controls can help to make sure that individuals are not identifiable within aggregate data.',
      :help_text_more_url => 'http://www.ons.gov.uk/ons/guide-method/best-practice/disclosure-control-policy-for-tables/index.html'
    a_individual 'yes, there is a risk that individuals be identified, for example by third parties with access to extra information',
      :text_as_statement => 'information that could identify individuals',
      :help_text => 'Some data is legitimately about individuals like civil service pay or public expenses for example.'

    q_statisticalAnonAudited 'Has your anonymisation process been independently audited?',
      :discussion_topic => :cz_statisticalAnonAudited,
      :display_on_certificate => true,
      :text_as_statement => 'The anonymisation process has been',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_dataPersonal, '==', :a_summarised
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'independently audited',
      :corresponding_requirements => ['standard_7']

    label_standard_7 'You should <strong>have your anonymisation process audited independently</strong> to ensure it reduces the risk of individuals being reidentified.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_dataPersonal, '==', :a_summarised
    condition_B :q_statisticalAnonAudited, '==', :a_false

    q_appliedAnon 'Have you attempted to reduce or remove the possibility of individuals being identified?',
      :discussion_topic => :cz_appliedAnon,
      :display_on_certificate => true,
      :text_as_statement => 'This data about individuals has been',
      :help_text => 'Anonymisation reduces the risk of individuals being identified from the data you publish. The best technique to use depends on the kind of data you have.',
      :pick => :one,
      :required => :pilot
    dependency :rule => 'A'
    condition_A :q_dataPersonal, '==', :a_individual
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'anonymised'

    q_lawfulDisclosure 'Are you required or permitted by law to publish this data about individuals?',
      :discussion_topic => :cz_lawfulDisclosure,
      :display_on_certificate => true,
      :text_as_statement => 'By law, this data about individuals',
      :help_text => 'The law might require you to publish data about people, such as the names of company directors. Or you might have permission from the affected individuals to publish information about them.',
      :pick => :one
    dependency :rule => 'A and B'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_false
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'can be published',
      :corresponding_requirements => ['pilot_5']

    label_pilot_5 'You should <strong>only publish personal data without anonymisation if you are required or permitted to do so by law</strong>.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_false
    condition_C :q_lawfulDisclosure, '==', :a_false

    q_lawfulDisclosureURL 'Where do you document your right to publish data about individuals?',
      :discussion_topic => :cz_lawfulDisclosureURL,
      :display_on_certificate => true,
      :text_as_statement => 'The right to publish this data about individuals is documented at'
    dependency :rule => 'A and B and C'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_false
    condition_C :q_lawfulDisclosure, '==', :a_true
    a_1 'Disclosure Rationale URL',
      :text,
      :input_type => :url,
      :placeholder => 'Disclosure Rationale URL',
      :corresponding_requirements => ['standard_8']

    label_standard_8 'You should <strong>document your right to publish data about individuals</strong> for people who use your data and for those affected by disclosure.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_false
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_lawfulDisclosureURL, '==', {:string_value => '', :answer_reference => '1'}

    q_privacyImpactAssessmentExists 'Have you carried out a Privacy Impact Assessment?',
      :discussion_topic => :cz_privacyImpactAssessmentExists,
      :display_on_certificate => true,
      :text_as_statement => 'The curator has',
      :help_text => 'A <a href="http://www.ico.gov.uk/for_organisations/data_protection/topic_guides/privacy_impact_assessment.aspx">Privacy Impact Assessment</a> is how you measure risks to the privacy of individuals in your data as well as the use and disclosure of that information.',
      :help_text_more_url => 'http://www.ico.gov.uk/for_organisations/data_protection/topic_guides/privacy_impact_assessment.aspx',
      :pick => :one
    dependency :rule => 'A and (B or C)'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    a_false 'no',
      :text_as_statement => 'not carried out a Privacy Impact Assessment'
    a_true 'yes',
      :text_as_statement => 'carried out a Privacy Impact Assessment',
      :corresponding_requirements => ['pilot_6']

    label_pilot_6 'You should <strong>do a Privacy Impact Assessment</strong> if you publish data about individuals.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B or C) and D'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_false

    q_privacyImpactAssessmentUrl 'Where is your Privacy Impact Assessment published?',
      :discussion_topic => :cz_privacyImpactAssessmentUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The Privacy Impact Assessment is published at',
      :help_text => 'Give a URL to where people can check how you have assessed the privacy risks to individuals. This may be redacted or summarised if it contains sensitive information.',
      :help_text_more_url => 'http://www.ico.gov.uk/for_organisations/data_protection/topic_guides/privacy_impact_assessment.aspx'
    dependency :rule => 'A and (B or C) and D'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    a_1 'Privacy Impact Assessment URL',
      :text,
      :input_type => :url,
      :placeholder => 'Privacy Impact Assessment URL',
      :corresponding_requirements => ['standard_9']

    label_standard_9 'You should <strong>publish your Privacy Impact Assessment</strong> so people can understand how you have assessed the risks of disclosing data.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B or C) and D and E'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_privacyImpactAssessmentUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_piaAudited 'Has your Privacy Impact Assessment been independently audited?',
      :discussion_topic => :cz_piaAudited,
      :display_on_certificate => true,
      :text_as_statement => 'The Privacy Impact Assessment has been',
      :help_text => 'It\'s good practice to check your assessment was done correctly. Independent audits by specialists or third-parties tend to be more rigorous and impartial.',
      :pick => :one
    dependency :rule => 'A and (B or C) and D and E'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_privacyImpactAssessmentUrl, '!=', {:string_value => '', :answer_reference => '1'}
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'independently audited',
      :corresponding_requirements => ['standard_10']

    label_standard_10 'You should <strong>have your Privacy Impact Assessment audited independently</strong> to ensure it has been carried out correctly.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B or C) and D and E and F'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_privacyImpactAssessmentUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_F :q_piaAudited, '==', :a_false

    q_individualConsentURL 'Where is the privacy notice for individuals affected by your data?',
      :discussion_topic => :cz_individualConsentURL,
      :display_on_certificate => true,
      :text_as_statement => 'Individuals affected by this data have this privacy notice',
      :help_text => 'When you collect data about individuals you must tell them how that data will be used. People who use your data need this to make sure they comply with the Data Protection Act.',
      :help_text_more_url => 'http://www.ico.org.uk/for_organisations/data_protection/the_guide/principle_2'
    dependency :rule => 'A and (B or C) and D and E'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_lawfulDisclosure, '!=', :a_true
    a_1 'Privacy Notice URL',
      :text,
      :input_type => :url,
      :placeholder => 'Privacy Notice URL',
      :corresponding_requirements => ['pilot_7']

    label_pilot_7 'You should <strong>tell people what purposes the individuals in your data consented to you using their data for</strong>. So that they use your data for the same purposes and comply with the Data Protection Act.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B or C) and D and E and F'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_lawfulDisclosure, '!=', :a_true
    condition_F :q_individualConsentURL, '==', {:string_value => '', :answer_reference => '1'}

    q_dpStaff 'Is there someone in your organisation who is responsible for data protection?',
      :discussion_topic => :cz_dpStaff,
      :pick => :one,
      :required => :pilot
    dependency :rule => 'A and (B or C) and D'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    a_false 'no'
    a_true 'yes'

    q_dbStaffConsulted 'Have you involved them in the Privacy Impact Assessment process?',
      :discussion_topic => :cz_dbStaffConsulted,
      :display_on_certificate => true,
      :text_as_statement => 'The individual responsible for data protection',
      :pick => :one
    dependency :rule => 'A and (B or C) and D and E'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_dpStaff, '==', :a_true
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'has been consulted',
      :corresponding_requirements => ['pilot_8']

    label_pilot_8 'You should <strong>involve the person responsible for data protection</strong> in your organisation before you publish this data.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B or C) and D and E and F'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_dpStaff, '==', :a_true
    condition_F :q_dbStaffConsulted, '==', :a_false

    q_anonymisationAudited 'Has your anonymisation approach been independently audited?',
      :discussion_topic => :cz_anonymisationAudited,
      :display_on_certificate => true,
      :text_as_statement => 'The anonymisation of the data has been',
      :help_text => 'It is good practice to make sure your process to remove personal identifiable data works properly. Independent audits by specialists or third-parties tend to be more rigorous and impartial.',
      :pick => :one
    dependency :rule => 'A and (B or C) and D'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'independently audited',
      :corresponding_requirements => ['standard_11']

    label_standard_11 'You should <strong>have your anonymisation process audited independently</strong> by an expert to ensure it is appropriate for your data.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B or C) and D and E'
    condition_A :q_dataPersonal, '==', :a_individual
    condition_B :q_appliedAnon, '==', :a_true
    condition_C :q_lawfulDisclosure, '==', :a_true
    condition_D :q_privacyImpactAssessmentExists, '==', :a_true
    condition_E :q_anonymisationAudited, '==', :a_false

  end

  section_practical 'Practical Information',
    :description => 'Findability, accuracy, quality and guarantees' do

    label_findability 'Findability',
      :help_text => 'how you help people find your data'

    q_onWebsite 'Is there a link to your data from your main website?',
      :discussion_topic => :onWebsite,
      :help_text => 'Data can be found more easily if it is linked to from your main website.',
      :pick => :one
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['standard_12']

    label_standard_12 'You should <strong>ensure that people can find the data from your main website</strong> so that people can find it more easily.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_onWebsite, '==', :a_false

    repeater 'Web Page' do

      dependency :rule => 'A'
      condition_A :q_onWebsite, '==', :a_true
      q_webpage 'Which page on your website links to the data?',
        :discussion_topic => :webpage,
        :display_on_certificate => true,
        :text_as_statement => 'The website links to the data from',
        :help_text => 'Give a URL on your main website that includes a link to this data.',
        :required => :required
      dependency :rule => 'A'
      condition_A :q_onWebsite, '==', :a_true
      a_1 'Web page URL',
        :text,
        :input_type => :url,
        :placeholder => 'Web page URL'

    end

    q_listed 'Is your data listed within a collection?',
      :discussion_topic => :listed,
      :help_text => 'Data is easier for people to find when it\'s in relevant data catalogs like academic, public sector or health for example, or when it turns up in relevant search results.',
      :pick => :one
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['standard_13']

    label_standard_13 'You should <strong>ensure that people can find your data when they search for it</strong> in locations that list data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_listed, '==', :a_false

    repeater 'Listing' do

      dependency :rule => 'A'
      condition_A :q_listed, '==', :a_true
      q_listing 'Where is it listed?',
        :discussion_topic => :listing,
        :display_on_certificate => true,
        :text_as_statement => 'The data appears in this collection',
        :help_text => 'Give a URL where this data is listed within a relevant collection. For example, data.gov.uk (if it\'s UK public sector data), hub.data.ac.uk (if it\'s UK academia data) or a URL for search engine results.',
        :required => :required
      dependency :rule => 'A'
      condition_A :q_listed, '==', :a_true
      a_1 'Listing URL',
        :text,
        :input_type => :url,
        :placeholder => 'Listing URL'

    end

    q_referenced 'Is this data referenced from your own publications?',
      :discussion_topic => :referenced,
      :help_text => 'When you reference your data within your own publications, such as reports, presentations or blog posts, you give it more context and help people find and understand it better.',
      :pick => :one
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['standard_14']

    label_standard_14 'You should <strong>reference data from your own publications</strong> so that people are aware of its availability and context.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_referenced, '==', :a_false

    repeater 'Reference' do

      dependency :rule => 'A'
      condition_A :q_referenced, '==', :a_true
      q_reference 'Where is your data referenced?',
        :discussion_topic => :reference,
        :display_on_certificate => true,
        :text_as_statement => 'This data is referenced from',
        :help_text => 'Give a URL to a document that cites or references this data.',
        :required => :required
      dependency :rule => 'A'
      condition_A :q_referenced, '==', :a_true
      a_1 'Reference URL',
        :text,
        :input_type => :url,
        :placeholder => 'Reference URL'

    end

    label_accuracy 'Accuracy',
      :help_text => 'how you keep your data up-to-date'

    q_serviceType 'Does the data behind your API change?',
      :discussion_topic => :serviceType,
      :display_on_certificate => true,
      :text_as_statement => 'The data behind the API',
      :pick => :one,
      :required => :pilot
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_service
    a_static 'no, the API gives access to unchanging data',
      :text_as_statement => 'will not change',
      :help_text => 'Some APIs just make accessing an unchanging dataset easier, particularly when there\'s lots of it.'
    a_changing 'yes, the API gives access to changing data',
      :text_as_statement => 'will change',
      :help_text => 'Some APIs give instant access to more up-to-date and ever-changing data'

    q_timeSensitive 'Will your data go out of date?',
      :discussion_topic => :timeSensitive,
      :display_on_certificate => true,
      :text_as_statement => 'The accuracy or relevance of this data will',
      :pick => :one
    dependency :rule => '(A or B or (C and D))'
    condition_A :q_releaseType, '==', :a_oneoff
    condition_B :q_releaseType, '==', :a_collection
    condition_C :q_releaseType, '==', :a_service
    condition_D :q_serviceType, '==', :a_static
    a_true 'yes, this data will go out of date',
      :text_as_statement => 'go out of date',
      :help_text => 'For example, a dataset of bus stop locations will go out of date over time as some are moved or new ones created.'
    a_timestamped 'yes, this data will go out of date over time but it’s time stamped',
      :text_as_statement => 'go out of date but it is timestamped',
      :help_text => 'For example, population statistics usually include a fixed timestamp to indicate when the statistics were relevant.',
      :corresponding_requirements => ['pilot_9']
    a_false 'no, this data does not contain any time-sensitive information',
      :text_as_statement => 'not go out of date',
      :help_text => 'For example, the results of an experiment will not go out of date because the data accurately reports observed outcomes.',
      :corresponding_requirements => ['standard_15']

    label_pilot_9 'You should <strong>put timestamps in your data when you release it</strong> so people know the period it relates to and when it will expire.',
      :is_requirement => 'true'
    dependency :rule => '(A or B or (C and D)) and (E and F)'
    condition_A :q_releaseType, '==', :a_oneoff
    condition_B :q_releaseType, '==', :a_collection
    condition_C :q_releaseType, '==', :a_service
    condition_D :q_serviceType, '==', :a_static
    condition_E :q_timeSensitive, '!=', :a_timestamped
    condition_F :q_timeSensitive, '!=', :a_false

    label_standard_15 'You should <strong>publish updates to time-sensitive data</strong> so that it does not go stale.',
      :is_requirement => 'true'
    dependency :rule => '(A or B or (C and D)) and (E)'
    condition_A :q_releaseType, '==', :a_oneoff
    condition_B :q_releaseType, '==', :a_collection
    condition_C :q_releaseType, '==', :a_service
    condition_D :q_serviceType, '==', :a_static
    condition_E :q_timeSensitive, '!=', :a_false

    q_frequentChanges 'Does this data change at least daily?',
      :discussion_topic => :frequentChanges,
      :display_on_certificate => true,
      :text_as_statement => 'This data changes',
      :help_text => 'Tell people if the underlying data changes on most days. When data changes frequently it also goes out of date quickly, so people need to know if you also update it frequently and quickly too.',
      :pick => :one,
      :required => :pilot
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_series
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'at least daily'

    q_seriesType 'What type of dataset series is this?',
      :discussion_topic => :seriesType,
      :display_on_certificate => true,
      :text_as_statement => 'This data is a series of',
      :pick => :one,
      :required => :exemplar
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    a_dumps 'regular copies of a complete database',
      :text_as_statement => 'copies of a database',
      :help_text => 'Choose if you publish new and updated copies of your full database regularly. When you create database dumps, it\'s useful for people to have access to a feed of the changes so they can keep their copies up to date.'
    a_aggregate 'regular aggregates of changing data',
      :text_as_statement => 'aggregates of changing data',
      :help_text => 'Choose if you create new datasets regularly. You might do this if the underlying data can\'t be released as open data or if you only publish data that\'s new since the last publication.'

    q_changeFeed 'Is a feed of changes available?',
      :discussion_topic => :changeFeed,
      :display_on_certificate => true,
      :text_as_statement => 'A feed of changes to this data',
      :help_text => 'Tell people if you provide a stream of changes that affect this data, like new entries or amendments to existing entries. Feeds might be in RSS, Atom or custom formats.',
      :pick => :one
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    condition_C :q_seriesType, '==', :a_dumps
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'is available',
      :corresponding_requirements => ['exemplar_6']

    label_exemplar_6 'You should <strong>provide a feed of changes to your data</strong> so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    condition_C :q_seriesType, '==', :a_dumps
    condition_D :q_changeFeed, '==', :a_false

    q_frequentSeriesPublication 'How often do you create a new release?',
      :discussion_topic => :frequentSeriesPublication,
      :display_on_certificate => true,
      :text_as_statement => 'New releases of this data are made',
      :help_text => 'This determines how out of date this data becomes before people can get an update.',
      :pick => :one
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    a_rarely 'less than once a month',
      :text_as_statement => 'less than once a month'
    a_monthly 'at least every month',
      :text_as_statement => 'at least every month',
      :corresponding_requirements => ['pilot_10']
    a_weekly 'at least every week',
      :text_as_statement => 'at least every week',
      :corresponding_requirements => ['standard_16']
    a_daily 'at least every day',
      :text_as_statement => 'at least every day',
      :corresponding_requirements => ['exemplar_7']

    label_pilot_10 'You should <strong>create a new dataset release every month</strong> so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and (C and D and E)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    condition_C :q_frequentSeriesPublication, '!=', :a_monthly
    condition_D :q_frequentSeriesPublication, '!=', :a_weekly
    condition_E :q_frequentSeriesPublication, '!=', :a_daily

    label_standard_16 'You should <strong>create a new dataset release every week</strong> so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and (C and D)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    condition_C :q_frequentSeriesPublication, '!=', :a_weekly
    condition_D :q_frequentSeriesPublication, '!=', :a_daily

    label_exemplar_7 'You should <strong>create a new dataset release every day</strong> so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and (C)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_frequentChanges, '==', :a_true
    condition_C :q_frequentSeriesPublication, '!=', :a_daily

    q_seriesPublicationDelay 'How long is the delay between when you create a dataset and when you publish it?',
      :discussion_topic => :seriesPublicationDelay,
      :display_on_certificate => true,
      :text_as_statement => 'The lag between creation and publication of this data is',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_series
    a_extreme 'longer than the gap between releases',
      :text_as_statement => 'longer than the gap between releases',
      :help_text => 'For example, if you create a new version of the dataset every day, choose this if it takes more than a day for it to be published.'
    a_reasonable 'about the same as the gap between releases',
      :text_as_statement => 'about the same as the gap between releases',
      :help_text => 'For example, if you create a new version of the dataset every day, choose this if it takes about a day for it to be published.',
      :corresponding_requirements => ['pilot_11']
    a_good 'less than half the gap between releases',
      :text_as_statement => 'less than half the gap between releases',
      :help_text => 'For example, if you create a new version of the dataset every day, choose this if it takes less than twelve hours for it to be published.',
      :corresponding_requirements => ['standard_17']
    a_minimal 'there is minimal or no delay',
      :text_as_statement => 'minimal',
      :help_text => 'Choose this if you publish within a few seconds or a few minutes.',
      :corresponding_requirements => ['exemplar_8']

    label_pilot_11 'You should <strong>have a reasonable delay between when you create and publish a dataset</strong> that is less than the gap between releases so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C and D)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_seriesPublicationDelay, '!=', :a_reasonable
    condition_C :q_seriesPublicationDelay, '!=', :a_good
    condition_D :q_seriesPublicationDelay, '!=', :a_minimal

    label_standard_17 'You should <strong>have a short delay between when you create and publish a dataset</strong> that is less than half the gap between releases so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_seriesPublicationDelay, '!=', :a_good
    condition_C :q_seriesPublicationDelay, '!=', :a_minimal

    label_exemplar_8 'You should <strong>have minimal or no delay between when you create and publish a dataset</strong> so people keep their copies up-to-date and accurate.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_seriesPublicationDelay, '!=', :a_minimal

    q_provideDumps 'Do you also publish dumps of this dataset?',
      :discussion_topic => :provideDumps,
      :display_on_certificate => true,
      :text_as_statement => 'The curator publishes',
      :help_text => 'A dump is an extract of the whole dataset into a file that people can download. This lets people do analysis that\'s different to analysis with API access.',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_service
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'dumps of the data',
      :corresponding_requirements => ['standard_18']

    label_standard_18 'You should <strong>let people download your entire dataset</strong> so that they can do more complete and accurate analysis with all the data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_false

    q_dumpFrequency 'How frequently do you create a new database dump?',
      :discussion_topic => :dumpFrequency,
      :display_on_certificate => true,
      :text_as_statement => 'Database dumps are created',
      :help_text => 'Faster access to more frequent extracts of the whole dataset means people can get started quicker with the most up-to-date data.',
      :pick => :one
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_serviceType, '==', :a_changing
    condition_C :q_provideDumps, '==', :a_true
    a_rarely 'less frequently than once a month',
      :text_as_statement => 'less frequently than once a month'
    a_monthly 'at least every month',
      :text_as_statement => 'at least every month',
      :corresponding_requirements => ['pilot_12']
    a_weekly 'within a week of any change',
      :text_as_statement => 'within a week of any change',
      :corresponding_requirements => ['standard_19']
    a_daily 'within a day of any change',
      :text_as_statement => 'within a day of any change',
      :corresponding_requirements => ['exemplar_9']

    label_pilot_12 'You should <strong>create a new database dump every month</strong> so that people have the latest data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and (D and E and F)'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_serviceType, '==', :a_changing
    condition_C :q_provideDumps, '==', :a_true
    condition_D :q_dumpFrequency, '!=', :a_monthly
    condition_E :q_dumpFrequency, '!=', :a_weekly
    condition_F :q_dumpFrequency, '!=', :a_daily

    label_standard_19 'You should <strong>create a new database dump within a week of any change</strong> so that people have less time to wait for the latest data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and (D and E)'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_serviceType, '==', :a_changing
    condition_C :q_provideDumps, '==', :a_true
    condition_D :q_dumpFrequency, '!=', :a_weekly
    condition_E :q_dumpFrequency, '!=', :a_daily

    label_exemplar_9 'You should <strong>create a new database dump within a day of any change</strong> so that people find it easier to get the latest data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and (D)'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_serviceType, '==', :a_changing
    condition_C :q_provideDumps, '==', :a_true
    condition_D :q_dumpFrequency, '!=', :a_daily

    q_corrected 'Will your data be corrected if it has errors?',
      :discussion_topic => :corrected,
      :display_on_certificate => true,
      :text_as_statement => 'Any errors in this data are',
      :help_text => 'It\'s good practice to fix errors in your data especially if you use it yourself. When you make corrections, people need to be told about them.',
      :pick => :one
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_timeSensitive, '!=', :a_true
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'corrected',
      :corresponding_requirements => ['standard_20']

    label_standard_20 'You should <strong>correct data when people report errors</strong> so everyone benefits from improvements in accuracy.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_timeSensitive, '!=', :a_true
    condition_C :q_corrected, '==', :a_false

    label_quality 'Quality',
      :help_text => 'how much people can rely on your data'

    q_qualityUrl 'Where do you document issues with the quality of this data?',
      :discussion_topic => :qualityUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Data quality is documented at',
      :help_text => 'Give a URL where people can find out about the quality of your data. People accept that errors are inevitable, from equipment malfunctions or mistakes that happen in system migrations. You should be open about quality so people can judge how much to rely on this data.'
    a_1 'Data Quality Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Data Quality Documentation URL',
      :corresponding_requirements => ['standard_21']

    label_standard_21 'You should <strong>document any known issues with your data quality</strong> so that people can decide how much to trust your data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_qualityUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_qualityControlUrl 'Where is your quality control process described?',
      :discussion_topic => :qualityControlUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Quality control processes are described at',
      :help_text => 'Give a URL for people to learn about ongoing checks on your data, either automatic or manual. This reassures them that you take quality seriously and encourages improvements that benefit everyone.'
    a_1 'Quality Control Process Description URL',
      :text,
      :input_type => :url,
      :placeholder => 'Quality Control Process Description URL',
      :corresponding_requirements => ['exemplar_10']

    label_exemplar_10 'You should <strong>document your quality control process</strong> so that people can decide how much to trust your data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_qualityControlUrl, '==', {:string_value => '', :answer_reference => '1'}

    label_guarantees 'Guarantees',
      :help_text => 'how much people can depend on your data’s availability'

    q_backups 'Do you take offsite backups?',
      :discussion_topic => :backups,
      :display_on_certificate => true,
      :text_as_statement => 'The data is',
      :help_text => 'Taking a regular offsite backup helps ensure that the data won\'t be lost in the case of accident.',
      :pick => :one
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'backed up offsite',
      :corresponding_requirements => ['standard_22']

    label_standard_22 'You should <strong>take a result offsite backup</strong> so that the data won\'t be lost if an accident happens.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_backups, '==', :a_false

    q_slaUrl 'Where do you describe any guarantees about service availability?',
      :discussion_topic => :slaUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Service availability is described at',
      :help_text => 'Give a URL for a page that describes what guarantees you have about your service being available for people to use. For example you might have a guaranteed uptime of 99.5%, or you might provide no guarantees.'
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_service
    a_1 'Service Availability Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Service Availability Documentation URL',
      :corresponding_requirements => ['standard_23']

    label_standard_23 'You should <strong>describe what guarantees you have around service availability</strong> so that people know how much they can rely on it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_slaUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_statusUrl 'Where do you give information about the current status of the service?',
      :discussion_topic => :statusUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Service status is given at',
      :help_text => 'Give a URL for a page that tells people about the current status of your service, including any faults you are aware of.'
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_service
    a_1 'Service Status URL',
      :text,
      :input_type => :url,
      :placeholder => 'Service Status URL',
      :corresponding_requirements => ['exemplar_11']

    label_exemplar_11 'You should <strong>have a service status page</strong> that tells people about the current status of your service.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_statusUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_onGoingAvailability 'How long will this data be available for?',
      :discussion_topic => :onGoingAvailability,
      :display_on_certificate => true,
      :text_as_statement => 'The data is available',
      :pick => :one
    a_experimental 'it might disappear at any time',
      :text_as_statement => 'experimentally and might disappear at any time'
    a_short 'it\'s available experimentally but should be around for another year or so',
      :text_as_statement => 'experimentally for another year or so',
      :corresponding_requirements => ['pilot_13']
    a_medium 'it\'s in your medium-term plans so should be around for a couple of years',
      :text_as_statement => 'for at least a couple of years',
      :corresponding_requirements => ['standard_24']
    a_long 'it\'s part of your day-to-day operations so will stay published for a long time',
      :text_as_statement => 'for a long time',
      :corresponding_requirements => ['exemplar_12']

    label_pilot_13 'You should <strong>guarantee that your data will be available in this form for at least a year</strong> so that people can decide how much to rely on your data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_onGoingAvailability, '!=', :a_short
    condition_B :q_onGoingAvailability, '!=', :a_medium
    condition_C :q_onGoingAvailability, '!=', :a_long

    label_standard_24 'You should <strong>guarantee that your data will be available in this form in the medium-term</strong> so that people can decide how much to trust your data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_onGoingAvailability, '!=', :a_medium
    condition_B :q_onGoingAvailability, '!=', :a_long

    label_exemplar_12 'You should <strong>guarantee that your data will be available in this form in the long-term</strong> so that people can decide how much to trust your data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_onGoingAvailability, '!=', :a_long

  end

  section_technical 'Technical Information',
    :description => 'Locations, formats and trust' do

    label_locations 'Locations',
      :help_text => 'how people can access your data'

    q_datasetUrl 'Where is your dataset?',
      :discussion_topic => :datasetUrl,
      :display_on_certificate => true,
      :text_as_statement => 'This data is published at',
      :help_text => 'Give a URL to the dataset itself. Open data should be linked to directly on the web so people can easily find and reuse it.'
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_oneoff
    a_1 'Dataset URL',
      :text,
      :input_type => :url,
      :placeholder => 'Dataset URL',
      :corresponding_requirements => ['basic_7', 'pilot_14']

    label_basic_7 'You must <strong>provide either a URL to your data or a URL to documentation</strong> about it so that people can find it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_oneoff
    condition_B :q_documentationUrl, '==', {:string_value => '', :answer_reference => '1'}
    condition_C :q_datasetUrl, '==', {:string_value => '', :answer_reference => '1'}

    label_pilot_14 'You should <strong>have a URL that is a direct link to the data itself</strong> so that people can access it easily.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_oneoff
    condition_B :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_C :q_datasetUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_versionManagement 'How do you publish a series of the same dataset?',
      :discussion_topic => :versionManagement,
      :corresponding_requirements => ['basic_8'],
      :pick => :any
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_series
    a_current 'as a single URL that\'s regularly updated',
      :help_text => 'Choose this if there\'s one URL for people to download the most recent version of the current dataset.',
      :corresponding_requirements => ['standard_25']
    a_template 'as consistent URLs for each release',
      :help_text => 'Choose this if your dataset URLs follow a regular pattern that includes the date of publication, for example, a URL that starts \'2013-04\'. This helps people to understand how often you release data, and to write scripts that fetch new ones each time they\'re released.',
      :corresponding_requirements => ['pilot_15']
    a_list 'as a list of releases',
      :help_text => 'Choose this if you have a list of datasets on a web page or a feed (like Atom or RSS) with links to each individual release and its details. This helps people to understand how often you release data, and to write scripts that fetch new ones each time they\'re released.',
      :corresponding_requirements => ['standard_26']

    label_standard_25 'You should <strong>have a single persistent URL to download the current version of your data</strong> so that people can access it easily.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_versionManagement, '!=', :a_current

    label_pilot_15 'You should <strong>use a consistent pattern for different release URLs</strong> so that people can download each one automatically.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_versionManagement, '!=', :a_template

    label_standard_26 'You should <strong>have a document or feed with a list of available releases</strong> so people can create scripts to download them all.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_versionManagement, '!=', :a_list

    label_basic_8 'You must <strong>provide access to releases of your data through a URL</strong> that gives the current version, a discoverable series of URLs or through a documentation page so that people can find it.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C and D and E)'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_documentationUrl, '==', {:string_value => '', :answer_reference => '1'}
    condition_C :q_versionManagement, '!=', :a_current
    condition_D :q_versionManagement, '!=', :a_template
    condition_E :q_versionManagement, '!=', :a_list

    q_currentDatasetUrl 'Where is your current dataset?',
      :discussion_topic => :currentDatasetUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The current dataset is available at',
      :help_text => 'Give a single URL to the most recent version of the dataset. The content at this URL should change each time a new version is released.',
      :required => :required
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_versionManagement, '==', :a_current
    a_1 'Current Dataset URL',
      :text,
      :input_type => :url,
      :placeholder => 'Current Dataset URL'

    q_versionsTemplateUrl 'What format do dataset release URLs follow?',
      :discussion_topic => :versionsTemplateUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Releases follow this consistent URL pattern',
      :help_text => 'This is the structure of URLs when you publish different releases. Use `{variable}` to indicate parts of the template URL that change, for example, `http://example.com/data/monthly/mydata-{YY}{MM}.csv`',
      :required => :required
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_versionManagement, '==', :a_template
    a_1 'Version Template URL',
      :string,
      :input_type => :text,
      :placeholder => 'Version Template URL'

    q_versionsUrl 'Where is your list of dataset releases?',
      :discussion_topic => :versionsUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Releases of this data are listed at',
      :help_text => 'Give a URL to a page or feed with a machine-readable list of datasets. Use the URL of the first page which should link to the rest of the pages.',
      :required => :required
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_series
    condition_B :q_versionManagement, '==', :a_list
    a_1 'Version List URL',
      :text,
      :input_type => :url,
      :placeholder => 'Version List URL'

    q_endpointUrl 'Where is the endpoint for your API?',
      :discussion_topic => :endpointUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The API service endpoint is',
      :help_text => 'Give a URL that\'s a starting point for people\'s scripts to access your API. This should be a service description document that helps the script to work out which services exist.'
    dependency :rule => 'A'
    condition_A :q_releaseType, '==', :a_service
    a_1 'Endpoint URL',
      :text,
      :input_type => :url,
      :placeholder => 'Endpoint URL',
      :corresponding_requirements => ['basic_9', 'standard_27']

    label_basic_9 'You must <strong>provide either an API endpoint URL or a URL to its documentation</strong> so that people can find it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_documentationUrl, '==', {:string_value => '', :answer_reference => '1'}
    condition_C :q_endpointUrl, '==', {:string_value => '', :answer_reference => '1'}

    label_standard_27 'You should <strong>have a service description document or single entry point for your API</strong> so that people can access it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_C :q_endpointUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_dumpManagement 'How do you publish database dumps?',
      :discussion_topic => :dumpManagement,
      :pick => :any
    dependency :rule => 'A and B'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    a_current 'as a single URL that\'s regularly updated',
      :help_text => 'Choose this if there\'s one URL for people to download the most recent version of the current database dump.',
      :corresponding_requirements => ['standard_28']
    a_template 'as consistent URLs for each release',
      :help_text => 'Choose this if your database dump URLs follow a regular pattern that includes the date of publication, for example, a URL that starts \'2013-04\'. This helps people to understand how often you release data, and to write scripts that fetch new ones each time they\'re released.',
      :corresponding_requirements => ['exemplar_13']
    a_list 'as a list of releases',
      :help_text => 'Choose this if you have a list of database dumps on a web page or a feed (such as Atom or RSS) with links to each individual release and its details. This helps people to understand how often you release data, and to write scripts that fetch new ones each time they\'re released.',
      :corresponding_requirements => ['exemplar_14']

    label_standard_28 'You should <strong>have a single persistent URL to download the current dump of your database</strong> so that people can find it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    condition_C :q_dumpManagement, '!=', :a_current

    label_exemplar_13 'You should <strong>use a consistent pattern for database dump URLs</strong> so that people can can download each one automatically.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    condition_C :q_dumpManagement, '!=', :a_template

    label_exemplar_14 'You should <strong>have a document or feed with a list of available database dumps</strong> so people can create scripts to download them all',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    condition_C :q_dumpManagement, '!=', :a_list

    q_currentDumpUrl 'Where is the current database dump?',
      :discussion_topic => :currentDumpUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The most recent database dump is always available at',
      :help_text => 'Give a URL to the most recent dump of the database. The content at this URL should change each time a new database dump is created.',
      :required => :required
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    condition_C :q_dumpManagement, '==', :a_current
    a_1 'Current Dump URL',
      :text,
      :input_type => :url,
      :placeholder => 'Current Dump URL'

    q_dumpsTemplateUrl 'What format do database dump URLs follow?',
      :discussion_topic => :dumpsTemplateUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Database dumps follow the consistent URL pattern',
      :help_text => 'This is the structure of URLs when you publish different releases. Use `{variable}` to indicate parts of the template URL that change, for example, `http://example.com/data/monthly/mydata-{YY}{MM}.csv`',
      :required => :required
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    condition_C :q_dumpManagement, '==', :a_template
    a_1 'Dump Template URL',
      :string,
      :input_type => :text,
      :placeholder => 'Dump Template URL'

    q_dumpsUrl 'Where is your list of available database dumps?',
      :discussion_topic => :dumpsUrl,
      :display_on_certificate => true,
      :text_as_statement => 'A list of database dumps is at',
      :help_text => 'Give a URL to a page or feed with a machine-readable list of database dumps. Use the URL of the first page which should link to the rest of the pages.',
      :required => :required
    dependency :rule => 'A and B and C'
    condition_A :q_releaseType, '==', :a_service
    condition_B :q_provideDumps, '==', :a_true
    condition_C :q_dumpManagement, '==', :a_list
    a_1 'Dump List URL',
      :text,
      :input_type => :url,
      :placeholder => 'Dump List URL'

    q_changeFeedUrl 'Where is your feed of changes?',
      :discussion_topic => :changeFeedUrl,
      :display_on_certificate => true,
      :text_as_statement => 'A feed of changes to this data is at',
      :help_text => 'Give a URL to a page or feed that provides a machine-readable list of the previous versions of the database dumps. Use the URL of the first page which should link to the rest of the pages.',
      :required => :required
    dependency :rule => 'A'
    condition_A :q_changeFeed, '==', :a_true
    a_1 'Change Feed URL',
      :text,
      :input_type => :url,
      :placeholder => 'Change Feed URL'

    label_format 'Formats',
      :help_text => 'how people can work with your data'

    q_machineReadable 'Is this data machine-readable?',
      :discussion_topic => :machineReadable,
      :display_on_certificate => true,
      :text_as_statement => 'This data is',
      :help_text => 'People prefer data formats which are easily processed by a computer, for speed and accuracy. For example, a scanned photocopy of a spreadsheet would not be machine-readable but a CSV file would be.',
      :pick => :one
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'machine-readable',
      :corresponding_requirements => ['pilot_16']

    label_pilot_16 'You should <strong>provide your data in a machine-readable format</strong> so that it\'s easy to process.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_machineReadable, '==', :a_false

    q_openStandard 'Is this data in a standard open format?',
      :discussion_topic => :openStandard,
      :display_on_certificate => true,
      :text_as_statement => 'The format of this data is',
      :help_text => 'Open standards are created through a fair, transparent and collaborative process. Anyone can implement them and there’s lots of support so it’s easier for you to share data with more people. For example, XML, CSV and JSON are open standards.',
      :help_text_more_url => 'https://www.gov.uk/government/uploads/system/uploads/attachment_data/file/183962/Open-Standards-Principles-FINAL.pdf',
      :pick => :one
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'a standard open format',
      :corresponding_requirements => ['standard_29']

    label_standard_29 'You should <strong>provide your data in an open standard format</strong> so that people can use widely available tools to process it more easily.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_openStandard, '==', :a_false

    q_dataType 'What kind of data do you publish?',
      :discussion_topic => :dataType,
      :pick => :any
    a_documents 'human-readable documents',
      :help_text => 'Choose this if your data is meant for human consumption. For example; policy documents, white papers, reports and meeting minutes. These usually have some structure to them but are mostly text.'
    a_statistical 'statistical data like counts, averages and percentages',
      :help_text => 'Choose this if your data is statistical or numeric data like counts, averages or percentages. Like census results, traffic flow information or crime statistics for example.'
    a_geographic 'geographic information, such as points and boundaries',
      :help_text => 'Choose this if your data can be plotted on a map as points, boundaries or lines.'
    a_structured 'other kinds of structured data',
      :help_text => 'Choose this if your data is structured in other ways. Like event details, railway timetables, contact information or anything that can be interpreted as data, and analysed and presented in multiple ways.'

    q_documentFormat 'Do your human-readable documents include formats that',
      :discussion_topic => :documentFormat,
      :display_on_certificate => true,
      :text_as_statement => 'Documents are published',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_dataType, '==', :a_documents
    a_semantic 'describe semantic structure like HTML, Docbook or Markdown',
      :text_as_statement => 'in a semantic format',
      :help_text => 'These formats label structures like chapters, headings and tables that make it easy to automatically create summaries like tables of contents and glossaries. They also make it easy to apply different styles to the document so its appearance changes.',
      :corresponding_requirements => ['standard_30']
    a_format 'describe information on formatting like OOXML or PDF',
      :text_as_statement => 'in a display format',
      :help_text => 'These formats emphasise appearance like fonts, colours and positioning of different elements within the page. These are good for human consumption, but aren\'t as easy for people to process automatically and change style.',
      :corresponding_requirements => ['pilot_17']
    a_unsuitable 'aren\'t meant for documents like Excel, JSON or CSV',
      :text_as_statement => 'in a format unsuitable for documents',
      :help_text => 'These formats better suit tabular or structured data.'

    label_standard_30 'You should <strong>publish documents in a format that exposes semantic structure</strong> so that people can display them in different styles.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B)'
    condition_A :q_dataType, '==', :a_documents
    condition_B :q_documentFormat, '!=', :a_semantic

    label_pilot_17 'You should <strong>publish documents in a format designed specifically for them</strong> so that they\'re easy to process.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C)'
    condition_A :q_dataType, '==', :a_documents
    condition_B :q_documentFormat, '!=', :a_semantic
    condition_C :q_documentFormat, '!=', :a_format

    q_statisticalFormat 'Does your statistical data include formats that',
      :discussion_topic => :statisticalFormat,
      :display_on_certificate => true,
      :text_as_statement => 'Statistical data is published',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_dataType, '==', :a_statistical
    a_statistical 'expose the structure of statistical hypercube data like <a href="http://sdmx.org/">SDMX</a> or <a href="http://www.w3.org/TR/vocab-data-cube/">Data Cube</a>',
      :text_as_statement => 'in a statistical data format',
      :help_text => 'Individual observations in hypercubes relate to a particular measure and a set of dimensions. Each observation may also be related to annotations that give extra context. Formats like <a href="http://sdmx.org/">SDMX</a> and <a href="http://www.w3.org/TR/vocab-data-cube/">Data Cube</a> are designed to express this underlying structure.',
      :corresponding_requirements => ['exemplar_15']
    a_tabular 'treat statistical data as a table like CSV',
      :text_as_statement => 'in a tabular data format',
      :help_text => 'These formats arrange statistical data within a table of rows and columns. This lacks extra context about the underlying hypercube but is easy to process.',
      :corresponding_requirements => ['standard_31']
    a_format 'focus on the format of tabular data like Excel',
      :text_as_statement => 'in a presentation format',
      :help_text => 'Spreadsheets use formatting like italic or bold text, and indentation within fields to describe its appearance and underlying structure. This styling helps people to understand the meaning of your data but makes it less suitable for computers to process.',
      :corresponding_requirements => ['pilot_18']
    a_unsuitable 'aren\'t meant for statistical or tabular data like Word or PDF',
      :text_as_statement => 'in a format unsuitable for statistical data',
      :help_text => 'These formats don\'t suit statistical data because they obscure the underlying structure of the data.'

    label_exemplar_15 'You should <strong>publish statistical data in a format that exposes dimensions and measures</strong> so that it\'s easy to analyse.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B)'
    condition_A :q_dataType, '==', :a_statistical
    condition_B :q_statisticalFormat, '!=', :a_statistical

    label_standard_31 'You should <strong>publish tabular data in a format that exposes tables of data</strong> so that it\'s easy to analyse.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C)'
    condition_A :q_dataType, '==', :a_statistical
    condition_B :q_statisticalFormat, '!=', :a_statistical
    condition_C :q_statisticalFormat, '!=', :a_tabular

    label_pilot_18 'You should <strong>publish tabular data in a format designed for that purpose</strong> so that it\'s easy to process.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C and D)'
    condition_A :q_dataType, '==', :a_statistical
    condition_B :q_statisticalFormat, '!=', :a_statistical
    condition_C :q_statisticalFormat, '!=', :a_tabular
    condition_D :q_statisticalFormat, '!=', :a_format

    q_geographicFormat 'Does your geographic data include formats that',
      :discussion_topic => :geographicFormat,
      :display_on_certificate => true,
      :text_as_statement => 'Geographic data is published',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_dataType, '==', :a_geographic
    a_specific 'are designed for geographic data like <a href="http://www.opengeospatial.org/standards/kml/">KML</a> or <a href="http://www.geojson.org/">GeoJSON</a>',
      :text_as_statement => 'in a geographic data format',
      :help_text => 'These formats describe points, lines and boundaries, and expose structures in the data which make it easier to process automatically.',
      :corresponding_requirements => ['exemplar_16']
    a_generic 'keeps data structured like JSON, XML or CSV',
      :text_as_statement => 'in a generic data format',
      :help_text => 'Any format that stores normal structured data can express geographic data too, particularly if it only holds data about points.',
      :corresponding_requirements => ['pilot_19']
    a_unsuitable 'aren\'t designed for geographic data like Word or PDF',
      :text_as_statement => 'in a format unsuitable for geographic data',
      :help_text => 'These formats don\'t suit geographic data because they obscure the underlying structure of the data.'

    label_exemplar_16 'You should <strong>publish geographic data in a format designed that purpose</strong> so that people can use widely available tools to process it.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B)'
    condition_A :q_dataType, '==', :a_geographic
    condition_B :q_geographicFormat, '!=', :a_specific

    label_pilot_19 'You should <strong>publish geographic data as structured data</strong> so that it\'s easy to process.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C)'
    condition_A :q_dataType, '==', :a_geographic
    condition_B :q_geographicFormat, '!=', :a_specific
    condition_C :q_geographicFormat, '!=', :a_generic

    q_structuredFormat 'Does your structured data include formats that',
      :discussion_topic => :structuredFormat,
      :display_on_certificate => true,
      :text_as_statement => 'Structured data is published',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_dataType, '==', :a_structured
    a_suitable 'are designed for structured data like JSON, XML, Turtle or CSV',
      :text_as_statement => 'in a structured data format',
      :help_text => 'These formats organise data into a basic structure of things which have values for a known set of properties. These formats are easy for computers to process automatically.',
      :corresponding_requirements => ['pilot_20']
    a_unsuitable 'aren\'t designed for structured data like Word or PDF',
      :text_as_statement => 'in a format unsuitable for structured data',
      :help_text => 'These formats don\'t suit this kind of data because they obscure its underlying structure.'

    label_pilot_20 'You should <strong>publish structured data in a format designed that purpose</strong> so that it\'s easy to process.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B)'
    condition_A :q_dataType, '==', :a_structured
    condition_B :q_structuredFormat, '!=', :a_suitable

    q_identifiers 'Does your data use persistent identifiers?',
      :discussion_topic => :identifiers,
      :display_on_certificate => true,
      :text_as_statement => 'The data includes',
      :help_text => 'Data is usually about real things like schools or roads or uses a coding scheme. If data from different sources use the same persistent and unique identifier to refer to the same things, people can combine sources easily to create more useful data. Identifiers might be GUIDs, DOIs or URLs.',
      :pick => :one
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'persistent identifiers',
      :corresponding_requirements => ['standard_32']

    label_standard_32 'You should <strong>use identifiers for things in your data</strong> so that they can be easily related with other data about those things.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_identifiers, '==', :a_false

    q_resolvingIds 'Can the identifiers in your data be used to find extra information?',
      :discussion_topic => :resolvingIds,
      :display_on_certificate => true,
      :text_as_statement => 'The persistent identifiers',
      :pick => :one
    dependency :rule => 'A'
    condition_A :q_identifiers, '==', :a_true
    a_false 'no, the identifiers can\'t be used to find extra information',
      :text_as_statement => ''
    a_service 'yes, there is a service that people can use to resolve the identifiers',
      :text_as_statement => 'resolve using a service',
      :help_text => 'Online services can be used to give people information about identifiers such as GUIDs or DOIs which can\'t be directly accessed in the way that URLs are.',
      :corresponding_requirements => ['standard_33']
    a_resolvable 'yes, the identifiers are URLs that resolve to give information',
      :text_as_statement => 'resolve because they are URLs',
      :help_text => 'URLs are useful for both people and computers. People can put a URL into their browser and read more information, like <a href="http://opencorporates.com/companies/gb/08030289">companies</a> and <a href="http://data.ordnancesurvey.co.uk/doc/postcodeunit/EC2A4JE">postcodes</a>. Computers can also process this extra information using scripts to access the underlying data.',
      :corresponding_requirements => ['exemplar_17']

    label_standard_33 'You should <strong>provide a service to resolve the identifiers you use</strong> so that people can find extra information about them.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B and C)'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_resolvingIds, '!=', :a_service
    condition_C :q_resolvingIds, '!=', :a_resolvable

    label_exemplar_17 'You should <strong>link to a web page of information about each of the things in your data</strong> so that people can easily find and share that information.',
      :is_requirement => 'true'
    dependency :rule => 'A and (B)'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_resolvingIds, '!=', :a_resolvable

    q_resolutionServiceURL 'Where is the service that is used to resolve the identifiers?',
      :discussion_topic => :resolutionServiceURL,
      :display_on_certificate => true,
      :text_as_statement => 'The identifier resolution service is at',
      :help_text => 'The resolution service should take an identifier as a query parameter and give back some information about the thing it identifies.'
    dependency :rule => 'A and B'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_resolvingIds, '==', :a_service
    a_1 'Identifier Resolution Service URL',
      :text,
      :input_type => :url,
      :placeholder => 'Identifier Resolution Service URL',
      :corresponding_requirements => ['standard_34']

    label_standard_34 'You should <strong>have a URL through which identifiers can be resolved</strong> so that more information about them can be found by a computer.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_resolvingIds, '==', :a_service
    condition_C :q_resolutionServiceURL, '==', {:string_value => '', :answer_reference => '1'}

    q_existingExternalUrls 'Is there third-party information about things in your data on the web?',
      :discussion_topic => :existingExternalUrls,
      :help_text => 'Sometimes other people outside your control provide URLs to the things your data is about. For example, your data might have postcodes in it that link to the Ordnance Survey website.',
      :pick => :one,
      :required => :exemplar
    dependency :rule => 'A'
    condition_A :q_identifiers, '==', :a_true
    a_false 'no'
    a_true 'yes'

    q_reliableExternalUrls 'Is that third-party information reliable?',
      :discussion_topic => :reliableExternalUrls,
      :help_text => 'If a third-party provides public URLs about things in your data, they probably take steps to ensure data quality and reliability. This is a measure of how much you trust their processes to do that. Look for their open data certificate or similar hallmarks to help make your decision.',
      :pick => :one,
      :required => :exemplar
    dependency :rule => 'A and B'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_existingExternalUrls, '==', :a_true
    a_false 'no'
    a_true 'yes'

    q_externalUrls 'Does your data use those third-party URLs?',
      :discussion_topic => :externalUrls,
      :display_on_certificate => true,
      :text_as_statement => 'Third-party URLs are',
      :help_text => 'You should use third-party URLs that resolve to information about the things your data describes. This reduces duplication and helps people combine data from different sources to make it more useful.',
      :pick => :one
    dependency :rule => 'A and B and C'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_existingExternalUrls, '==', :a_true
    condition_C :q_reliableExternalUrls, '==', :a_true
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'referenced in this data',
      :corresponding_requirements => ['exemplar_18']

    label_exemplar_18 'You should <strong>use URLs to third-party information in your data</strong> so that it\'s easy to combine with other data that uses those URLs.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C and D'
    condition_A :q_identifiers, '==', :a_true
    condition_B :q_existingExternalUrls, '==', :a_true
    condition_C :q_reliableExternalUrls, '==', :a_true
    condition_D :q_externalUrls, '==', :a_false

    label_trust 'Trust',
      :help_text => 'how much trust people can put in your data'

    q_provenance 'Do you provide machine-readable provenance for your data?',
      :discussion_topic => :provenance,
      :display_on_certificate => true,
      :text_as_statement => 'The provenance of this data is',
      :help_text => 'This about the origins of how your data was created and processed before it was published. It builds trust in the data you publish because people can trace back how it has been handled.',
      :help_text_more_url => 'http://www.w3.org/TR/prov-primer/',
      :pick => :one
    a_false 'no',
      :text_as_statement => ''
    a_true 'yes',
      :text_as_statement => 'machine-readable',
      :corresponding_requirements => ['exemplar_19']

    label_exemplar_19 'You should <strong>provide a machine-readable provenance trail</strong> about your data so that people can trace how it was processed.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_provenance, '==', :a_false

    q_digitalCertificate 'Where do you describe how people can verify that data they receive comes from you?',
      :discussion_topic => :digitalCertificate,
      :display_on_certificate => true,
      :text_as_statement => 'This data can be verified using',
      :help_text => 'If you deliver important data to people they should be able to check that what they receive is the same as what you published. For example, you can digitally sign the data you publish, so people can tell if it has been tampered with.'
    a_1 'Verification Process URL',
      :text,
      :input_type => :url,
      :placeholder => 'Verification Process URL',
      :corresponding_requirements => ['exemplar_20']

    label_exemplar_20 'You should <strong>describe how people can check that the data they receive is the same as what you published</strong> so that they can trust it.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_digitalCertificate, '==', {:string_value => '', :answer_reference => '1'}

  end

  section_social 'Social Information',
    :description => 'Documentation, support and services' do

    label_documentation 'Documentation',
      :help_text => 'how you help people understand the context and content of your data'

    q_documentationMetadata 'Does your data documentation include machine-readable data for:',
      :discussion_topic => :documentationMetadata,
      :display_on_certificate => true,
      :text_as_statement => 'The documentation includes machine-readable data for',
      :pick => :any
    dependency :rule => 'A'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    a_title 'title',
      :text_as_statement => 'title',
      :corresponding_requirements => ['standard_35']
    a_description 'description',
      :text_as_statement => 'description',
      :corresponding_requirements => ['standard_36']
    a_issued 'release date',
      :text_as_statement => 'release date',
      :corresponding_requirements => ['standard_37']
    a_modified 'modification date',
      :text_as_statement => 'modification date',
      :corresponding_requirements => ['standard_38']
    a_accrualPeriodicity 'frequency of releases',
      :text_as_statement => 'release frequency',
      :corresponding_requirements => ['standard_39']
    a_identifier 'identifier',
      :text_as_statement => 'identifier',
      :corresponding_requirements => ['standard_40']
    a_landingPage 'landing page',
      :text_as_statement => 'landing page',
      :corresponding_requirements => ['standard_41']
    a_language 'language',
      :text_as_statement => 'language',
      :corresponding_requirements => ['standard_42']
    a_publisher 'publisher',
      :text_as_statement => 'publisher',
      :corresponding_requirements => ['standard_43']
    a_spatial 'spatial/geographical coverage',
      :text_as_statement => 'spatial/geographical coverage',
      :corresponding_requirements => ['standard_44']
    a_temporal 'temporal coverage',
      :text_as_statement => 'temporal coverage',
      :corresponding_requirements => ['standard_45']
    a_theme 'theme(s)',
      :text_as_statement => 'theme(s)',
      :corresponding_requirements => ['standard_46']
    a_keyword 'keyword(s) or tag(s)',
      :text_as_statement => 'keyword(s) or tag(s)',
      :corresponding_requirements => ['standard_47']
    a_distribution 'distribution(s)',
      :text_as_statement => 'distribution(s)'

    label_standard_35 'You should <strong>include a machine-readable data title in your documentation</strong> so that people know how to refer to it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_title

    label_standard_36 'You should <strong>include a machine-readable data description in your documentation</strong> so that people know what it contains.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_description

    label_standard_37 'You should <strong>include a machine-readable data release date in your documentation</strong> so that people know how timely it is.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_issued

    label_standard_38 'You should <strong>include a machine-readable last modification date in your documentation</strong> so that people know they have the latest data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_modified

    label_standard_39 'You should <strong>provide machine-readable metadata about how frequently you release new versions of your data</strong> so people know how often you update it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_accrualPeriodicity

    label_standard_40 'You should <strong>include a canonical URL for the data in your machine-readable documentation</strong> so that people know how to access it consistently.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_identifier

    label_standard_41 'You should <strong>include a canonical URL to the machine-readable documentation itself</strong> so that people know how to access to it consistently.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_landingPage

    label_standard_42 'You should <strong>include the data language in your machine-readable documentation</strong> so that people who search for it will know whether they can understand it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_language

    label_standard_43 'You should <strong>indicate the data publisher in your machine-readable documentation</strong> so people can decide how much to trust your data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_publisher

    label_standard_44 'You should <strong>include the geographic coverage in your machine-readable documentation</strong> so that people understand where your data applies to.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_spatial

    label_standard_45 'You should <strong>include the time period in your machine-readable documentation</strong> so that people understand when your data applies to.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_temporal

    label_standard_46 'You should <strong>include the subject in your machine-readable documentation</strong> so that people know roughly what your data is about.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_theme

    label_standard_47 'You should <strong>include machine-readable keywords or tags in your documentation</strong> to help people search within the data effectively.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '!=', :a_keyword

    q_distributionMetadata 'Does your documentation include machine-readable metadata for each distribution on:',
      :discussion_topic => :distributionMetadata,
      :display_on_certificate => true,
      :text_as_statement => 'The documentation about each distribution includes machine-readable data for',
      :pick => :any
    dependency :rule => 'A and B'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '==', :a_distribution
    a_title 'title',
      :text_as_statement => 'title',
      :corresponding_requirements => ['standard_48']
    a_description 'description',
      :text_as_statement => 'description',
      :corresponding_requirements => ['standard_49']
    a_issued 'release date',
      :text_as_statement => 'release date',
      :corresponding_requirements => ['standard_50']
    a_modified 'modification date',
      :text_as_statement => 'modification date',
      :corresponding_requirements => ['standard_51']
    a_rights 'rights statement',
      :text_as_statement => 'rights statement',
      :corresponding_requirements => ['standard_52']
    a_accessURL 'URL to access the data',
      :text_as_statement => 'a URL to access the data',
      :help_text => 'This metadata should be used when your data isn\'t available as a download, like an API for example.'
    a_downloadURL 'URL to download the dataset',
      :text_as_statement => 'a URL to download the dataset'
    a_byteSize 'size in bytes',
      :text_as_statement => 'size in bytes'
    a_mediaType 'type of download media',
      :text_as_statement => 'type of download media'

    label_standard_48 'You should <strong>include machine-readable titles within your documentation</strong> so people know how to refer to each data distribution.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '==', :a_distribution
    condition_C :q_distributionMetadata, '!=', :a_title

    label_standard_49 'You should <strong>include machine-readable descriptions within your documentation</strong> so people know what each data distribution contains.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '==', :a_distribution
    condition_C :q_distributionMetadata, '!=', :a_description

    label_standard_50 'You should <strong>include machine-readable release dates within your documentation</strong> so people know how current each distribution is.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '==', :a_distribution
    condition_C :q_distributionMetadata, '!=', :a_issued

    label_standard_51 'You should <strong>include machine-readable last modification dates within your documentation</strong> so people know whether their copy of a data distribution is up-to-date.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '==', :a_distribution
    condition_C :q_distributionMetadata, '!=', :a_modified

    label_standard_52 'You should <strong>include a machine-readable link to the applicable rights statement</strong> so people can find out what they can do with a data distribution.',
      :is_requirement => 'true'
    dependency :rule => 'A and B and C'
    condition_A :q_documentationUrl, '!=', {:string_value => '', :answer_reference => '1'}
    condition_B :q_documentationMetadata, '==', :a_distribution
    condition_C :q_distributionMetadata, '!=', :a_rights

    q_technicalDocumentation 'Where is the technical documentation for the data?',
      :discussion_topic => :technicalDocumentation,
      :display_on_certificate => true,
      :text_as_statement => 'The technical documentation for the data is at'
    a_1 'Technical Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Technical Documentation URL',
      :corresponding_requirements => ['pilot_21']

    label_pilot_21 'You should <strong>provide technical documentation for the data</strong> so that people understand how to use it.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_technicalDocumentation, '==', {:string_value => '', :answer_reference => '1'}

    q_vocabulary 'Do the data formats use vocabularies or schemas?',
      :discussion_topic => :vocabulary,
      :help_text => 'Formats like CSV, JSON, XML or Turtle use custom vocabularies or schemas which say what columns or properties the data contains.',
      :pick => :one,
      :required => :standard
    a_false 'no'
    a_true 'yes'

    q_schemaDocumentationUrl 'Where is documentation about your data vocabularies?',
      :discussion_topic => :schemaDocumentationUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The vocabularies used by this data are documented at'
    dependency :rule => 'A'
    condition_A :q_vocabulary, '==', :a_true
    a_1 'Schema Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Schema Documentation URL',
      :corresponding_requirements => ['standard_53']

    label_standard_53 'You should <strong>document any vocabulary you use within your data</strong> so that people know how to interpret it.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_vocabulary, '==', :a_true
    condition_B :q_schemaDocumentationUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_codelists 'Are there any codes used in this data?',
      :discussion_topic => :codelists,
      :help_text => 'If your data uses codes to refer to things like geographical areas, spending categories or diseases for example, these need to be explained to people.',
      :pick => :one,
      :required => :standard
    a_false 'no'
    a_true 'yes'

    q_codelistDocumentationUrl 'Where are any codes in your data documented?',
      :discussion_topic => :codelistDocumentationUrl,
      :display_on_certificate => true,
      :text_as_statement => 'The codes in this data are documented at'
    dependency :rule => 'A'
    condition_A :q_codelists, '==', :a_true
    a_1 'Codelist Documentation URL',
      :text,
      :input_type => :url,
      :placeholder => 'Codelist Documentation URL',
      :corresponding_requirements => ['standard_54']

    label_standard_54 'You should <strong>document the codes used within your data</strong> so that people know how to interpret them.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_codelists, '==', :a_true
    condition_B :q_codelistDocumentationUrl, '==', {:string_value => '', :answer_reference => '1'}

    label_support 'Support',
      :help_text => 'how you communicate with people who use your data'

    q_contactUrl 'Where can people find out how to contact someone with questions about this data?',
      :discussion_topic => :contactUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Find out how to contact someone about this data at',
      :help_text => 'Give a URL for a page that describes how people can contact someone if they have questions about the data.'
    a_1 'Contact Documentation',
      :text,
      :input_type => :url,
      :placeholder => 'Contact Documentation',
      :corresponding_requirements => ['pilot_22']

    label_pilot_22 'You should <strong>provide contact information for people to send questions</strong> about your data to.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_contactUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_improvementsContact 'Where can people find out how to improve the way your data is published?',
      :discussion_topic => :improvementsContact,
      :display_on_certificate => true,
      :text_as_statement => 'Find out how to suggest improvements to publication at'
    a_1 'Improvement Suggestions URL',
      :text,
      :input_type => :url,
      :placeholder => 'Improvement Suggestions URL',
      :corresponding_requirements => ['pilot_23']

    label_pilot_23 'You should <strong>provide instructions about how suggest improvements</strong> to the way you publish data so you can discover what people need.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_improvementsContact, '==', {:string_value => '', :answer_reference => '1'}

    q_dataProtectionUrl 'Where can people find out how to contact someone with questions about privacy?',
      :discussion_topic => :dataProtectionUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Find out where to send questions about privacy at'
    a_1 'Confidentiality Contact Documentation',
      :text,
      :input_type => :url,
      :placeholder => 'Confidentiality Contact Documentation',
      :corresponding_requirements => ['pilot_24']

    label_pilot_24 'You should <strong>provide contact information for people to send questions about privacy</strong> and disclosure of personal details to.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_dataProtectionUrl, '==', {:string_value => '', :answer_reference => '1'}

    q_socialMedia 'Do you use social media to connect with people who use your data?',
      :discussion_topic => :socialMedia,
      :pick => :one
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['standard_55']

    label_standard_55 'You should <strong>use social media to reach people who use your data</strong> and discover how your data is being used',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_socialMedia, '==', :a_false

    repeater 'Account' do

      dependency :rule => 'A'
      condition_A :q_socialMedia, '==', :a_true
      q_account 'Which social media accounts can people reach you on?',
        :discussion_topic => :account,
        :display_on_certificate => true,
        :text_as_statement => 'Contact the curator through these social media accounts',
        :help_text => 'Give URLs to your social media accounts, like your Twitter or Facebook profile page.',
        :required => :required
      dependency :rule => 'A'
      condition_A :q_socialMedia, '==', :a_true
      a_1 'Social Media URL',
        :text,
        :input_type => :url,
        :placeholder => 'Social Media URL'

    end

    q_forum 'Where should people discuss this dataset?',
      :discussion_topic => :forum,
      :display_on_certificate => true,
      :text_as_statement => 'Discuss this data at',
      :help_text => 'Give a URL to your forum or mailing list where people can talk about your data.'
    a_1 'Forum or Mailing List URL',
      :text,
      :input_type => :url,
      :placeholder => 'Forum or Mailing List URL',
      :corresponding_requirements => ['standard_56']

    label_standard_56 'You should <strong>tell people where they can discuss your data</strong> and support one another.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_forum, '==', {:string_value => '', :answer_reference => '1'}

    q_correctionReporting 'Where can people find out how to request corrections to your data?',
      :discussion_topic => :correctionReporting,
      :display_on_certificate => true,
      :text_as_statement => 'Find out how to request data corrections at',
      :help_text => 'Give a URL where people can report errors they spot in your data.'
    dependency :rule => 'A'
    condition_A :q_corrected, '==', :a_true
    a_1 'Correction Instructions URL',
      :text,
      :input_type => :url,
      :placeholder => 'Correction Instructions URL',
      :corresponding_requirements => ['standard_57']

    label_standard_57 'You should <strong>provide instructions about how people can report errors</strong> in your data.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_corrected, '==', :a_true
    condition_B :q_correctionReporting, '==', {:string_value => '', :answer_reference => '1'}

    q_correctionDiscovery 'Where can people find out how to get notifications of corrections to your data?',
      :discussion_topic => :correctionDiscovery,
      :display_on_certificate => true,
      :text_as_statement => 'Find out how to get notifications about data corrections at',
      :help_text => 'Give a URL where you describe how notifications about corrections are shared with people.'
    dependency :rule => 'A'
    condition_A :q_corrected, '==', :a_true
    a_1 'Correction Notification URL',
      :text,
      :input_type => :url,
      :placeholder => 'Correction Notification URL',
      :corresponding_requirements => ['standard_58']

    label_standard_58 'You should <strong>provide a mailing list or feed with updates</strong> that people can use to keep their copies of your data up-to-date.',
      :is_requirement => 'true'
    dependency :rule => 'A and B'
    condition_A :q_corrected, '==', :a_true
    condition_B :q_correctionDiscovery, '==', {:string_value => '', :answer_reference => '1'}

    q_engagementTeam 'Do you have anyone who actively builds a community around this data?',
      :discussion_topic => :engagementTeam,
      :help_text => 'A community engagement team will engage through social media, blogging, and arrange hackdays or competitions to encourage people to use the data.',
      :help_text_more_url => 'http://theodi.org/guide/engaging-reusers',
      :pick => :one
    a_false 'no'
    a_true 'yes',
      :corresponding_requirements => ['exemplar_21']

    label_exemplar_21 'You should <strong>build a community of people around your data</strong> to encourage wider use of your data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_engagementTeam, '==', :a_false

    q_engagementTeamUrl 'Where is their home page?',
      :discussion_topic => :engagementTeamUrl,
      :display_on_certificate => true,
      :text_as_statement => 'Community engagement is done by',
      :required => :required
    dependency :rule => 'A'
    condition_A :q_engagementTeam, '==', :a_true
    a_1 'Community Engagement Team Home Page URL',
      :text,
      :input_type => :url,
      :placeholder => 'Community Engagement Team Home Page URL'

    label_services 'Services',
      :help_text => 'how you give people access to tools they need to work with your data'

    q_libraries 'Where do you list tools to work with your data?',
      :discussion_topic => :libraries,
      :display_on_certificate => true,
      :text_as_statement => 'Tools to help use this data are listed at',
      :help_text => 'Give a URL that lists the tools you know or recommend people can use when they work with your data.'
    a_1 'Tool URL',
      :text,
      :input_type => :url,
      :placeholder => 'Tool URL',
      :corresponding_requirements => ['exemplar_22']

    label_exemplar_22 'You should <strong>provide a list of software libraries and other readily-available tools</strong> so that people can quickly get to work with your data.',
      :is_requirement => 'true'
    dependency :rule => 'A'
    condition_A :q_libraries, '==', {:string_value => '', :answer_reference => '1'}

  end

end
