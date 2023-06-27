import shutil, os

shutil.copy('sourcefile_path', 'destfile_path')  # file can be renamed with dest_path\renamedname
shutil.copytree('source_path', 'dest_path')  # copy folder with contents
shutil.move('source_path', 'dest_path')  # move (cut and paste) file/path, use it to rename files as well

os.unlink('file_path')  # permanently deletes a file
os.rmdir('dir_path')  # permanently deletes an empty directory
shutil.rmtree('dir_path')  # permanently deletes a directory with contents

print('send2trash 3rd party module will send a file or folder to the recycling bin instead of permanently deleting')
