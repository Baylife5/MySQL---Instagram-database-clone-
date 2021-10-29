DELIMITER $$

CREATE TRIGGER follow_who
    BEFORE INSERT ON followers FOR EACH ROW 
    BEGIN 
        IF NEW.followee_id = NEW.follower_id
        THEN 
            SIGNAL SQLSTATE '45001'
                SET MESSAGE_TEXT = " INSTAGRAM DOES NOT ALLOW YOU TO FOLLOWER YOURSELF";
        END IF;
    END;
$$
DELIMITER;

DELIMITER $$

CREATE TRIGGER unfollowings
    AFTER DELETE ON followers FOR EACH ROW 
    BEGIN 
        INSERT INTO unfollows(unfollowee_id,unfollower_id) 
        VALUES (OLD.followee_id,OLD.follower_id);
END; 
$$
DELIMITER;
