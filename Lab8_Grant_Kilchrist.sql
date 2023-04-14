SELECT * FROM citation;

/*.	(1pt) List monarch type, name, and number of the predecessor of Queen Victoria I.*/
SELECT p.montype, p.monname, p.monnum FROM monarch m, monarch p WHERE m.premonname = p.monname
AND m.premonnum = p.monnum AND m.monname = 'Victoria' AND m.monnum = 'I';

/*2.	(1pt) List monarch type, name, and number of the successor of Queen Victoria I. */
SELECT montype, monname, monnum FROM monarch WHERE premonname = 'Victoria' AND premonnum = 'I';

/* 3.	(1pt) List the first names and salaries of employees who are a boss. */
SELECT DISTINCT b.empfname, b.empsalary FROM emp e, emp b WHERE e.bossno = b.empno;

/* 4.	(1pt) List all the employees (name and salary) who are managed by Alice. */
SELECT empfname, empsalary FROM text.emp WHERE bossno = '1';

/* 5.	(1pt) For each boss, list the average salary of the employees who work for him or her. Include the first name of the boss. */
SELECT b.empfname, AVG(e.empsalary) FROM text.emp e, text.emp b WHERE e.bossno = b.empno;

/* 6.	(1pts) Find out which patents are citing patent No. 3992014. */
SELECT c.patentNo, c.cited FROM citation c, patents p 
WHERE c.cited = '3992014' AND c.cited = p.patent;

/* 7.	(2pts) Find out which patents are citing patent No. 3992014. List the category and applied year of the citing patents. */
SELECT c.patentNo, c.cited, p.yearofapply, p.category
FROM citation c, patents p WHERE c.cited = '3992014' 
AND c.cited = p.patent;

/* 8.	(2pts) Find out which patents are citing patent No. 3992014. List the category and applied year of both cited and citing patents. */
SELECT c.patentNo, c.cited, p.yearofapply AS YOA, p.category AS category, 
citedp.yearofapply AS YOAcited, citedp.category AS categoryCited
FROM citation c, patents p, patents citedp WHERE c.cited = '3992014'
AND c.cited = citedp.patent AND c.patentNo = p.patent; 