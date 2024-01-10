/*
  Warnings:

  - You are about to drop the column `starDate` on the `Education` table. All the data in the column will be lost.
  - You are about to drop the column `starDate` on the `Project` table. All the data in the column will be lost.
  - Added the required column `startDate` to the `Education` table without a default value. This is not possible if the table is not empty.
  - Added the required column `startDate` to the `Project` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Education" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "institution" TEXT NOT NULL,
    "grade" TEXT NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "currentlyStudying" BOOLEAN NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Education_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Education" ("currentlyStudying", "curriculumId", "endDate", "grade", "id", "institution") SELECT "currentlyStudying", "curriculumId", "endDate", "grade", "id", "institution" FROM "Education";
DROP TABLE "Education";
ALTER TABLE "new_Education" RENAME TO "Education";
CREATE TABLE "new_Project" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "institutionOrCompany" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Project_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Project" ("curriculumId", "description", "endDate", "id", "institutionOrCompany") SELECT "curriculumId", "description", "endDate", "id", "institutionOrCompany" FROM "Project";
DROP TABLE "Project";
ALTER TABLE "new_Project" RENAME TO "Project";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
