#!/bin/bash
chmod -R 777 /home/cesm_user/data/
chmod -R 777 /opt/ncar/cesm2/test/
#chown -R cesm_user:cesm_user /home/cesm_user/data/
#chown -R cesm_user:cesm_user /opt/ncar/cesm2/test/

OUTPUT_FILE="/home/cesm_user/data/test_output.txt"

# Redirect all outputs (stdout & stderr) to the OUTPUT_FILE
exec &> $OUTPUT_FILE

# Navigate to the specified directory
cd /opt/ncar/cesm2/cime/scripts

# Ensure the directory exists before creating a new case. If the directory exists, this will be a no-op.
mkdir -p /opt/ncar/cesm2/test
# Run the specified commands
/opt/ncar/cesm2/cime/scripts/create_newcase --case /opt/ncar/cesm2/test/FXSD --compset FXSD --res f19_f19 --run-unsupported
/opt/ncar/cesm2/cime/scripts/Tools/xmlchange NTASKS=60
/opt/ncar/cesm2/cime/scripts/Tools/case.setup
/opt/ncar/cesm2/cime/scripts/Tools/case.build
/opt/ncar/cesm2/cime/scripts/Tools/case.submit

# Display output to keep the container running
cat $OUTPUT_FILE
