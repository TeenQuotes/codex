# Update dependencies
composer update

# Pull the latest version of the documentation
rm -rf public/docs/manual
cd public/docs
git clone https://github.com/TeenQuotes/api-documentation
mkdir manual
mv api-documentation manual/1.0
cd manual/1.0
mv README.md introduction.md
sed -i 's#https://github.com/TeenQuotes/api-documentation/blob/master##g' introduction.md

# Clear cache
php artisan cache:clear
