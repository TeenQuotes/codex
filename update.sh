# Update code
git pull

# Update dependencies
composer update

# Remove old directories
rm -rf public/docs/api
rm -rf public/docs/deep-links

# Create directories
cd public/docs
mkdir api
mkdir deep-links

# Pull the latest version of the API
git clone https://github.com/TeenQuotes/api-documentation tmp
mv tmp api/1.0
cd api/1.0
# The first file is introduction.md for Codex
mv README.md introduction.md
# Replace URLs
find ./ -type f -exec sed -i 's#https://github.com/TeenQuotes/api-documentation/blob/master##g' *.md {} \;
cd ../..

# Pull the latest version of the doc for deep links
git clone https://github.com/TeenQuotes/deep-links tmp
mv tmp deep-links/1.0

# Clear cache
cd ../../
php artisan cache:clear