
SELECT user.user_name AS "list of users",
       photo_url AS "photo" FROM user      
    INNER JOIN photos 
    ON user.id = photos.id;



SELECT user.user_name AS "oldest users", 
       DATE(created_at) AS " Sign up date " 
    FROM user ORDER BY user_name DESC LIMIT 5;



SELECT DAYNAME(created_at) AS WEEKDAYS, 
       COUNT(*) AS REGISTRATION
    FROM user GROUP BY WEEKDAYS 
    ORDER BY REGISTRATION DESC LIMIT 2;


SELECT user_name AS " USERS THAT HAVE NEVER POSTED ", 
       IFNULL(photo_url,"no post") AS "PHOTO EXTENTIONS"
    FROM user LEFT JOIN photos ON user.id = user_id
    WHERE photo_url IS NULL;



SELECT user_name AS user, 
        photo_url AS photo, 
        photo_id AS "photo id",
        COUNT(photo_id) AS "Most liked photo"
    FROM user INNER JOIN photos ON user.id = photos.user_id 
        INNER JOIN likes ON photos.id = likes.photo_id
        GROUP BY user, photo,photo_id
    ORDER BY photo_id DESC LIMIT 1;


SELECT
        (SELECT COUNT(photos.user_id) FROM photos) / (SELECT COUNT(id) FROM user) AS "average number of posts"
    FROM user INNER JOIN photos ON user.id = photos.user_id
        GROUP BY photos.user_id
        ORDER BY photos.user_id DESC
    LIMIT  1;



SELECT user_name AS users,
       COUNT(user_id) AS "number of posts"
    FROM user LEFT JOIN photos ON user.id = photos.user_id
        GROUP BY user_name
    ORDER BY COUNT(user_id) DESC;


SELECT tag,
       COUNT(tag_id) FROM tags 
    INNER JOIN photo_hash_tags ON tags.hash_id = photo_hash_tags.tag_id
    GROUP BY tag
    ORDER BY COUNT(tag_id) DESC
    LIMIT 5;



SELECT user_name AS BOTS,
       COUNT(followee_id) AS liked
    FROM user
    INNER JOIN likes ON user.id = likes.followee_id
    GROUP BY BOTS
    HAVING liked = (SELECT COUNT(id) FROM photos);
