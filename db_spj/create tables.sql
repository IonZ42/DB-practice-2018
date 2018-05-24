CREATE TABLE s (
	sno VARCHAR (10) NOT NULL,
	sname VARCHAR (40) UNIQUE,
	STATUS VARCHAR (40),
	city VARCHAR (40),
	PRIMARY KEY (sno)
);

CREATE TABLE p (
	pno VARCHAR (10),
	pname VARCHAR (40) NOT NULL,
	color VARCHAR (40),
	weight VARCHAR (40) CHECK (weight > 0),
	PRIMARY KEY (pno)
);

CREATE TABLE j (
	jno VARCHAR (10),
	jname VARCHAR (40) NOT NULL DEFAULT 'factory',
	city VARCHAR (40),
	PRIMARY KEY (jno)
);

CREATE TABLE spj (
	sno VARCHAR (10),
	pno VARCHAR (10),
	jno VARCHAR (10),
	qty VARCHAR (40) NOT NULL,
	FOREIGN KEY (sno) REFERENCES s (sno) ON DELETE SET NULL,
  FOREIGN KEY (pno) REFERENCES p (pno) ON DELETE SET NULL,
  FOREIGN KEY (jno) REFERENCES j (jno) ON DELETE SET NULL
);

