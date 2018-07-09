FROM apline

# Add script to create default users / vhosts
ADD setup.sh /setup.sh

# Set correct executable permissions
RUN chmod +x /setup.sh

# Define default command
CMD ["/setup.sh"]
