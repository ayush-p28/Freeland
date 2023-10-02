package utils;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.util.List;
import java.io.File;

public class FileUpload {
    public static String uploadFile(HttpServletRequest request, String uploadPath) {
        String fileName = "";
        
        if(ServletFileUpload.isMultipartContent(request)) {
            ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());

            List<FileItem> fileItems = null;

            try {
                fileItems = sfu.parseRequest(request);
            } catch(FileUploadException e) {
                e.printStackTrace();
            }

            int i = 0;
            for(FileItem fileItem : fileItems) {
                String currentFileName = fileItem.getName();
                
                if(i==0) {
                    fileName += currentFileName;
                } else {
                    fileName += (", "+currentFileName);
                }
                
                i++;

                File file = new File(uploadPath, currentFileName);

                try {
                    fileItem.write(file);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }

        return fileName;
    }
}