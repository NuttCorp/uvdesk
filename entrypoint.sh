service apache2 restart

# Step down from sudo to uvdesk
/usr/local/bin/gosu uvdesk "$@"

exec "$@"
