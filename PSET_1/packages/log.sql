
-- *** The Lost Letter ***
-- first getting the address of the address from which the letter was sent
SELECT id FROM addresses WHERE address = '900 Somerville Avenue';
-- second using this id as from_address_id to check the contents of the packages sent from this address
SELECT * FROM packages WHERE from_address_id = (SELECT id FROM addresses WHERE address = '900 Somerville Avenue');
-- third after checking that the content was saved as Congratulatory letter, we use it to get to_address_id
SELECT to_address_id FROM packages WHERE contents = 'Congratulatory letter';
-- last we get the type of this address using its id
SELECT "type", "address" FROM "addresses" WHERE "id" = (SELECT "to_address_id" FROM "packages" WHERE "contents" = 'Congratulatory letter');

-- *** The Devious Delivery ***
-- seaching for the packages that don't have from_address_id
SELECT contents FROM packages WHERE from_address_id IS NULL;
-- found out that there is only one package
SELECT type from addresses where id = (
    SELECT address_id from scans where action = 'Drop' AND package_id = (
        SELECT id from packages where from_address_id is null
    )
);
-- *** The Forgotten Gift ***
-- using addresses of the old man and his granddaughter to know all about his packages
SELECT * FROM packages WHERE
from_address_id = (SELECT id FROM addresses WHERE address = '109 Tileston Street')
AND
to_address_id = (SELECT id FROM addresses WHERE address = '728 Maple Place');
-- using the same address to get the driver_id and getting the name of the driver
SELECT name FROM drivers WHERE id = (
    SELECT driver_id FROM scans WHERE package_id = (
        select id from packages where from_address_id = (
            select id from addresses where address = '109 Tileston Street'
        )
    )
) order by (
    select timestamp from scans
) desc;
