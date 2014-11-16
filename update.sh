# Update dependencies
composer update

# Pull the latest version of the documentation
rm -rf public/docs/api
cd public/docs
git clone https://github.com/TeenQuotes/api-documentation
mkdir api
mv api-documentation api/1.0
cd api/1.0
mv README.md introduction.md
sed -i 's#https://github.com/TeenQuotes/api-documentation/blob/master##g' introduction.md

# Clear cache
cd ../../../../
php artisan cache:clear