class Image < ActiveRecord::Base
	belongs_to :user
	has_attached_file :attachment,
                    :styles => {:small => "150x150>"},
										:storage => :s3,
										:s3_host_name => 's3-us-west-2.amazonaws.com',
										:s3_credentials => "#{Rails.root}/config/aws.yml";


# Validate content type
  validates_attachment_content_type :attachment, :content_type => /\Aimage/
# Validate filename
  validates_attachment_file_name :attachment, :matches => [/png\Z/, /jpe?g\Z/]
# Explicitly do not validate
  do_not_validate_attachment_file_type :attachment


end