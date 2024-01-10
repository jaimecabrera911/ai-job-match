/*
  Warnings:

  - You are about to drop the column `starDate` on the `Work` table. All the data in the column will be lost.
  - Added the required column `startDate` to the `Work` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Curriculum" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT,
    "profile" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "Curriculum_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Curriculum" ("id", "profile", "userId", "uuid") SELECT "id", "profile", "userId", "uuid" FROM "Curriculum";
DROP TABLE "Curriculum";
ALTER TABLE "new_Curriculum" RENAME TO "Curriculum";
CREATE TABLE "new_Work" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "company" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "startDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "currentlyWorking" BOOLEAN NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Work_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_Work" ("company", "currentlyWorking", "curriculumId", "description", "endDate", "id", "position") SELECT "company", "currentlyWorking", "curriculumId", "description", "endDate", "id", "position" FROM "Work";
DROP TABLE "Work";
ALTER TABLE "new_Work" RENAME TO "Work";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;
