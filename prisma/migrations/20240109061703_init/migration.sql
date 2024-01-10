-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Project" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "institutionOrCompany" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Project_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Project" ("curriculumId", "description", "endDate", "id", "institutionOrCompany", "startDate") SELECT "curriculumId", "description", "endDate", "id", "institutionOrCompany", "startDate" FROM "Project";
DROP TABLE "Project";
ALTER TABLE "new_Project" RENAME TO "Project";
CREATE TABLE "new_Work" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "company" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "currentlyWorking" BOOLEAN NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Work_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Work" ("company", "currentlyWorking", "curriculumId", "description", "endDate", "id", "position", "startDate") SELECT "company", "currentlyWorking", "curriculumId", "description", "endDate", "id", "position", "startDate" FROM "Work";
DROP TABLE "Work";
ALTER TABLE "new_Work" RENAME TO "Work";
CREATE TABLE "new_Education" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "institution" TEXT NOT NULL,
    "grade" TEXT NOT NULL,
    "startDate" TEXT NOT NULL,
    "endDate" TEXT NOT NULL,
    "currentlyStudying" BOOLEAN NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Education_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Education" ("currentlyStudying", "curriculumId", "endDate", "grade", "id", "institution", "startDate") SELECT "currentlyStudying", "curriculumId", "endDate", "grade", "id", "institution", "startDate" FROM "Education";
DROP TABLE "Education";
ALTER TABLE "new_Education" RENAME TO "Education";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
