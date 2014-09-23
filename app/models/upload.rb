class Upload < ActiveRecord::Base
  
    mount_uploader :file, FileUploader
  
    def get_extension
      case self.file.file.content_type
      when 'image/jpeg'
        return 'jpg'
      when 'image/png'
        return 'png'
      when 'image/gif'
        return 'gif'
      when 'application/pdf'
        return 'pdf'
      else
        return 'none'
      end
    end
  
end
