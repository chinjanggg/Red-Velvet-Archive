/*view twitter*/
CREATE VIEW twitter AS
SELECT belongsto.member, fansite.fname, fansite.twitterLink
FROM belongsto, fansite
where belongsto.fname = fansite.fName