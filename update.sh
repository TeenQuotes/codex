# Update code
git pull

# Update dependencies
composer update

# Pull the latest version of the API
git clone https://github.com/TeenQuotes/api-documentation tmp-api
cd tmp-api
# The first file is introduction.md for Codex
mv README.md introduction.md
# Replace URLs
find ./ -type f -exec sed -i 's#https://github.com/TeenQuotes/api-documentation/blob/master##g' *.md {} \;
cd ..

# Pull the latest version of the doc for deep links
git clone https://github.com/TeenQuotes/deep-links tmp-deep-links

# Remove old directories
rm -rf public/docs/api
rm -rf public/docs/deep-links

# Create directories
mkdir -p public/docs/api
mkdir -p public/docs/deep-links

# Move directories
mv tmp-api public/docs/api/1.0
mv tmp-deep-links public/docs/deep-links/1.0

# Clear cache
php artisan cache:clear

rm -rf tmp-api
rm -rf tmp-deep-links
