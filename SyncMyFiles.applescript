-- Sync folders function definition
on syncFolders()
    -- Get the home directory dynamically
    set homeDirectory to do shell script "echo $HOME"
    
    -- Define source folder on the internal drive
    set sourceFolder to homeDirectory & "/Desktop/mix-files"
    
    -- Define destination folder on the external drive
    set destinationFolder to "/Volumes/passport/mix-files"
    
    -- Single rsync command with flags:
    -- '-a' for 'archive mode', preserving attributes
    -- '--ignore-existing' to skip existing files
    -- '--delete' to remove files in destination not present in source
    set rsyncCommand to "rsync -av --ignore-existing --delete " & quoted form of sourceFolder & "/ " & quoted form of destinationFolder & "/"
    
    try
        do shell script rsyncCommand
        -- Get end time and notify user that sync is completed
        set endTime to current date
        display notification "Sync Completed at " & endTime as string with title "Sync Mix Files"
    on error errMsg
        display dialog "An error occurred: " & errMsg
    end try
end syncFolders

-- Ask user for permission to run the script
set userChoice to button returned of (display dialog "Do you want to sync files?" buttons {"Sync Files", "Stop"} default button "Sync Files")

if userChoice is "Sync Files" then
    -- Get start time and notify user that sync is starting
    set startTime to current date
    display notification "Sync Started at " & startTime as string with title "Sync Mix Files"
    
    -- Execute the syncFolders function
    syncFolders()

else
    display dialog "Sync cancelled."
end if
