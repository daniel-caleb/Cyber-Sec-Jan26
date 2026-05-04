#!/bin/bash

echo "Setting up Secure Lab Environment..."

mkdir -p secure_lab/projcts
mkdir -p secure_lab/docs
mkdir -p secure_lab/script
mkdir -p secure_lab/temp

# Create misnamed files
touch secure_lab/projcts/proj1.txt
touch secure_lab/projcts/proj2.tx
touch secure_lab/docs/note.txt
touch secure_lab/docs/todoo.txt

# Script file (intentionally missing execute permission)
echo -e "#!/bin/bash\necho 'Backup running...'" > secure_lab/script/backup.sh

# Temporary file
echo "Old system data" > secure_lab/temp/old_data.txt

# Add incorrect permissions (intentionally broken)
chmod 400 secure_lab/projcts/proj1.txt
chmod 000 secure_lab/projcts/proj2.tx
chmod 644 secure_lab/docs/note.txt
chmod 600 secure_lab/docs/todoo.txt
chmod 644 secure_lab/script/backup.sh

echo "Setup complete. Start your investigation in secure_lab/"