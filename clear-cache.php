<?php
    // Clear Laravel configuration and cache
    echo "Clearing Laravel Cache...<br>";

    // Run Artisan commands
    exec('php artisan config:clear');
    exec('php artisan cache:clear');
    exec('php artisan route:clear');
    exec('php artisan view:clear');

    echo "Rebuilding configuration cache...<br>";
    exec('php artisan config:cache');

    echo "Done!";
?>
