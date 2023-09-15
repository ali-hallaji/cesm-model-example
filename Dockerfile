FROM escomp/cesm-lab-2.2

# Set user as root to have permission to execute the following commands
USER root

# Copy the script and make it executable
COPY test.sh /opt/ncar/cesm2/scripts/test.sh
RUN chmod +x /opt/ncar/cesm2/scripts/test.sh

# Create the desired directory
RUN mkdir -p /opt/ncar/cesm2/test

# Switch back to a non-root user (replace 'user' with the correct user if it's different)
USER user

# Set the CMD to start Jupyter with --allow-root
#CMD ["jupyter", "lab", "--ip='0.0.0.0'", "--port=8888", "--no-browser", "--allow-root"]
