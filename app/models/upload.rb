class Upload < ActiveRecord::Base
  
    mount_uploader :file, FileUploader
    process_in_background :file
    store_in_background :file
    
  
    def get_extension
      if(self.file_processing == false)
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
      else
        return 'none'
      end
    end
  
end
