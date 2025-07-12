<p align="center"><img src="./screenshots/envirogreen-logo.png" width="400" alt="Envirogreen Logo"></p>

# Envirogreen Backend API (Laravel 11)

This repository contains the Laravel 11 backend API for the Envirogreen real estate platform. It provides RESTful API endpoints that power the Next.js 14 frontend application.

## ⚠️ Important Note

**This backend server must be running before starting the frontend application.** The Next.js frontend depends on these API endpoints for all data operations.

## Features

- **RESTful API Architecture**: Clean API design following REST principles
- **Authentication**: Secure user authentication with Laravel Sanctum
- **Role-Based Access Control**: Admin, staff, and user role management
- **Property Listings Management**: Complete CRUD operations for real estate listings
- **Search Functionality**: Advanced search with multiple filters
- **Blog System**: Content management for the blog section
- **Admin Dashboard**: API endpoints for the admin control panel
- **MySQL Database**: Robust data storage with relationships

## API Endpoints

The backend provides numerous endpoints including:

- Authentication (login/register)
- Listings (search, filter, CRUD operations)
- User management
- Blog posts and categories
- Admin operations
- Wishlist functionality
- Contact and newsletter management

## Requirements

- PHP 8.2+
- Composer
- MySQL 8.0+
- Laravel 11.x

## Setup Instructions

1. **Clone the repository**

2. **Install dependencies**
   ```
   composer install
   ```

3. **Set up environment file**
   ```
   cp .env.example .env
   php artisan key:generate
   ```

4. **Configure database**
   - Edit the `.env` file with your database credentials
   ```
   DB_CONNECTION=mysql
   DB_HOST=127.0.0.1
   DB_PORT=3306
   DB_DATABASE=envirogreen
   DB_USERNAME=root
   DB_PASSWORD=your_password
   ```

5. **Import database**
   - Use the provided SQL file: `enviro-24-1-4-25.sql`
   - Or run migrations: `php artisan migrate`

6. **Start the server**
   ```
   php artisan serve
   ```
   By default, the API will be available at `http://localhost:8000`

## Connecting with the Frontend

The Next.js frontend is configured to communicate with this backend API. Make sure:

1. The backend server is running first
2. The frontend's API URL is correctly pointing to this backend
3. CORS is properly configured in both applications

## API Documentation

The API provides endpoints for:

- `/api/listings` - Property listings management
- `/api/auth` - User authentication
- `/api/admin` - Admin operations
- `/api/blogs` - Blog content management
- `/api/wishlist` - User wishlist functionality
- `/api/contact` - Contact form submissions

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
