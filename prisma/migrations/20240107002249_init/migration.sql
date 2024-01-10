-- CreateTable
CREATE TABLE "User" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "username" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "personalInformationId" INTEGER NOT NULL,
    CONSTRAINT "User_personalInformationId_fkey" FOREIGN KEY ("personalInformationId") REFERENCES "PersonalInformation" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "PersonalInformation" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "fullName" TEXT NOT NULL,
    "address" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "gender" TEXT NOT NULL,
    "cellphone" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Curriculum" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT NOT NULL,
    "profile" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    CONSTRAINT "Curriculum_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Work" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "company" TEXT NOT NULL,
    "position" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "starDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "currentlyWorking" BOOLEAN NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Work_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Education" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "institution" TEXT NOT NULL,
    "grade" TEXT NOT NULL,
    "starDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "currentlyStudying" BOOLEAN NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Education_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Project" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "institutionOrCompany" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "starDate" DATETIME NOT NULL,
    "endDate" DATETIME NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    CONSTRAINT "Project_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Language" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "LanguagesOnCurriculums" (
    "languageId" INTEGER NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    "level" TEXT NOT NULL,

    PRIMARY KEY ("languageId", "curriculumId"),
    CONSTRAINT "LanguagesOnCurriculums_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Language" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "LanguagesOnCurriculums_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Offer" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "uuid" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "company" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "requirements" TEXT NOT NULL,
    "responsibilities" TEXT NOT NULL,
    "benefits" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "Apply" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "analysis" TEXT NOT NULL,
    "score" DECIMAL NOT NULL,
    "curriculumId" INTEGER NOT NULL,
    "offerId" INTEGER NOT NULL,
    CONSTRAINT "Apply_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Apply_offerId_fkey" FOREIGN KEY ("offerId") REFERENCES "Offer" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "SkillsOnCurriculum" (
    "skillId" INTEGER NOT NULL,
    "curriculumId" INTEGER NOT NULL,

    PRIMARY KEY ("skillId", "curriculumId"),
    CONSTRAINT "SkillsOnCurriculum_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skill" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "SkillsOnCurriculum_curriculumId_fkey" FOREIGN KEY ("curriculumId") REFERENCES "Curriculum" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Skill" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");
