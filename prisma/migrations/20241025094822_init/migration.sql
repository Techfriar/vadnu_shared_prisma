-- CreateEnum
CREATE TYPE "ApplicationCategoryConditon" AS ENUM ('IS', 'NOT', 'IS_HIGHER_THAN', 'IS_LOWER_THAN', 'EQUAL');

-- CreateEnum
CREATE TYPE "ApplicationCategoryContent" AS ENUM ('THIS_WEEK', 'THIS_MONTH', 'THIS_YEAR', 'ASSESSMENT', 'RESUME', 'TWENTY_FIVE_PERCENT', 'FIFTY_PERCENT', 'SIXTY_PERCENT', 'SEVENTY_PERCENT', 'SEVENTY_FIVE_PERCENT', 'EIGHTY_PERCENT', 'EIGHTY_FIVE_PERCENT', 'NINETY_PERCENT', 'NINETY_FIVE_PERCENT', 'ENTRY_LEVEL', 'JUNIOR', 'INTERMEDIATE', 'SENIOR', 'LESS_THAN_ONE', 'ONE_TO_TWO', 'THREE_TO_FIVE', 'SIX_TO_TEN', 'ELEVEN_PLUS', 'INTERVIEW', 'PENDING_ACTION', 'UNDER_REVIEW', 'SHORT_LISTED', 'OFFERED', 'HIRED', 'TURNED_DOWN', 'ON_HOLD', 'INVITED_TO_APPLY');

-- CreateEnum
CREATE TYPE "ApplicationSelectedCategory" AS ENUM ('INTERVIEW_DATE', 'DATE_APPLIED_ON', 'SCREENING_MODE', 'SCORE', 'LEVEL', 'YEAR_OF_EXPERIENCE', 'STATUS');

-- CreateEnum
CREATE TYPE "AccountStatus" AS ENUM ('ACTIVE', 'DEACTIVATED', 'DELETED');

-- CreateEnum
CREATE TYPE "Condition" AS ENUM ('IS', 'NOT');

-- CreateEnum
CREATE TYPE "CompanyStatus" AS ENUM ('ACTIVE', 'INACTIVE', 'CLOSED');

-- CreateEnum
CREATE TYPE "ComparisonCondition" AS ENUM ('AND', 'OR');

-- CreateEnum
CREATE TYPE "ExpertiseLevel" AS ENUM ('ENTRY_LEVEL', 'JUNIOR', 'INTERMEDIATE', 'SENIOR');

-- CreateEnum
CREATE TYPE "ExpertiseYear" AS ENUM ('LESS_THAN_ONE', 'ONE_TO_TWO', 'THREE_TO_FIVE', 'SIX_TO_TEN', 'ELEVEN_PLUS');

-- CreateEnum
CREATE TYPE "FilterCondition" AS ENUM ('IS', 'NOT');

-- CreateEnum
CREATE TYPE "DateCategory" AS ENUM ('THIS_WEEK', 'THIS_MONTH', 'THIS_YEAR');

-- CreateEnum
CREATE TYPE "JobApplicationStatus" AS ENUM ('INTERVIEW', 'PENDING_ACTION', 'UNDER_REVIEW', 'SHORT_LISTED', 'OFFERED', 'HIRED', 'TURNED_DOWN', 'ON_HOLD', 'INVITED_TO_APPLY');

-- CreateEnum
CREATE TYPE "JobExpectedSalary" AS ENUM ('FIXED', 'RANGE');

-- CreateEnum
CREATE TYPE "JobExpertiseType" AS ENUM ('LEVEL', 'YEAR');

-- CreateEnum
CREATE TYPE "MethodOfApplication" AS ENUM ('RESUME', 'ASSESSMENT');

-- CreateEnum
CREATE TYPE "JobMode" AS ENUM ('HYBRID', 'ON_SITE', 'REMOTE');

-- CreateEnum
CREATE TYPE "JobPostedBy" AS ENUM ('ADMIN', 'COMPANY');

-- CreateEnum
CREATE TYPE "JobQualification" AS ENUM ('HIGH_SCHOOL_DIPLOMA_OR_EQUIVALENT', 'ASSOCIATES_DEGREE', 'BACHELORS_DEGREE', 'MASTER_DEGREE', 'DOCTORATE_PHD', 'VOCATIONAL_OR_TECHNICAL_CERTIFICATE');

-- CreateEnum
CREATE TYPE "JobStatus" AS ENUM ('ACTIVE', 'CLOSED', 'INACTIVE');

-- CreateEnum
CREATE TYPE "JobType" AS ENUM ('FULL_TIME', 'PART_TIME', 'INTERNSHIP');

-- CreateEnum
CREATE TYPE "NotificationType" AS ENUM ('REPORT', 'JOB_POSTING', 'PAYMENT', 'REQUEST');

-- CreateEnum
CREATE TYPE "ReferralCodeStatus" AS ENUM ('ACTIVE', 'DEACTIVATED');

-- CreateEnum
CREATE TYPE "ReportedUser" AS ENUM ('candidates', 'companies');

-- CreateEnum
CREATE TYPE "UserTypes" AS ENUM ('ADMIN', 'COMPANY', 'CANDIDATE');

-- CreateEnum
CREATE TYPE "VerificationStatus" AS ENUM ('PENDING', 'VERIFIED', 'REJECTED');

-- CreateTable
CREATE TABLE "ApplicationFilterComparison" (
    "id" SERIAL NOT NULL,
    "filterDataPairNumber" INTEGER NOT NULL,
    "value" "ComparisonCondition" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ApplicationFilterComparison_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApplicationFilterData" (
    "id" SERIAL NOT NULL,
    "selectedCategory" "ApplicationSelectedCategory" NOT NULL,
    "condition" "ApplicationCategoryConditon" NOT NULL,
    "categoryContent" "ApplicationCategoryContent" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ApplicationFilterData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ApplicationSavedFilter" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ApplicationSavedFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateTransactions" (
    "id" SERIAL NOT NULL,
    "transactionId" TEXT,
    "accountHolder" TEXT,
    "candidateId" INTEGER NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "dateOfModified" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "invoiceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modifiedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateTransactions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyTransactions" (
    "id" SERIAL NOT NULL,
    "transactionId" TEXT,
    "accountHolder" TEXT,
    "companyId" INTEGER NOT NULL,
    "amount" DOUBLE PRECISION,
    "dateOfModified" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "invoiceId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "modifiedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyTransactions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invoice" (
    "id" SERIAL NOT NULL,
    "invoiceNo" TEXT,
    "billingFrom" TEXT,
    "billingAddress" TEXT,
    "summaryId" INTEGER NOT NULL,

    CONSTRAINT "Invoice_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "InvoiceSummary" (
    "id" SERIAL NOT NULL,
    "description" TEXT,
    "dateOfIssue" TEXT,
    "modeOfPayment" TEXT,
    "cardNumber" TEXT,
    "accountHolder" TEXT,
    "cost" DOUBLE PRECISION,
    "tax" DOUBLE PRECISION,

    CONSTRAINT "InvoiceSummary_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BoostPlan" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "duration" INTEGER NOT NULL,
    "priceValue" DOUBLE PRECISION NOT NULL,
    "features" TEXT[],
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "BoostPlan_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateFilterComparison" (
    "id" SERIAL NOT NULL,
    "candidateSavedFilterId" INTEGER,
    "filterDataPairNumber" INTEGER NOT NULL,
    "value" "ComparisonCondition" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateFilterComparison_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateFilterData" (
    "id" SERIAL NOT NULL,
    "dateCategory" "DateCategory",
    "fromDate" TEXT,
    "toDate" TEXT,
    "condition" "FilterCondition" NOT NULL,
    "status" TEXT,
    "candidateSavedFilterId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateFilterData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateSavedFilter" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateSavedFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Candidate" (
    "id" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phoneNumber" TEXT,
    "profilePicture" TEXT,
    "countryCode" TEXT,
    "dateOfBirth" TEXT,
    "referralCode" TEXT,
    "isJobReady" BOOLEAN,
    "location" TEXT,
    "highlight" TEXT,
    "initiative" TEXT,
    "aboutMeTitle" TEXT,
    "aboutMeDescription" TEXT,
    "jobStatus" TEXT,
    "appointmentLetter" TEXT,
    "currentCTC" TEXT,
    "accountStatus" "AccountStatus" DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Candidate_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateCertifications" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "name" TEXT,
    "authority" TEXT,
    "certifiedNumber" TEXT,
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "certificate" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateCertifications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateCoreCareers" (
    "id" SERIAL NOT NULL,
    "careerId" INTEGER NOT NULL,
    "candidateId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateCoreCareers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateEducation" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "qualification" TEXT,
    "fieldOfStudy" TEXT,
    "location" TEXT,
    "cgpa" DOUBLE PRECISION,
    "startDate" TIMESTAMP(3),
    "endDate" TIMESTAMP(3),
    "isGoing" BOOLEAN,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateEducation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateFollowing" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "company" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateFollowing_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateJobRoles" (
    "id" SERIAL NOT NULL,
    "jobRoleId" INTEGER NOT NULL,
    "candidateId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateJobRoles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateLanguages" (
    "id" SERIAL NOT NULL,
    "languageId" INTEGER NOT NULL,
    "candidateId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateLanguages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidatePreferredJobLocations" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "location" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidatePreferredJobLocations_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateResumes" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "resume" TEXT,
    "isDefault" BOOLEAN,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateResumes_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateSkills" (
    "id" SERIAL NOT NULL,
    "skillId" INTEGER NOT NULL,
    "candidateId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateSkills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateSocialLinks" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "website" TEXT,
    "portfolio" TEXT,
    "linkedIn" TEXT,
    "twitter" TEXT,
    "facebook" TEXT,
    "instagram" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateSocialLinks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CandidateWorkExperience" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "company" TEXT,
    "joiningDate" TIMESTAMP(3),
    "relievingDate" TIMESTAMP(3),
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CandidateWorkExperience_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Category" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Chatroom" (
    "id" SERIAL NOT NULL,
    "lastMessageId" INTEGER,
    "isGroup" BOOLEAN DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Chatroom_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "CompanyCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyFilterDataComparison" (
    "id" SERIAL NOT NULL,
    "filterDataPairNumber" INTEGER NOT NULL,
    "value" "ComparisonCondition" NOT NULL,
    "companySavedFilterId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyFilterDataComparison_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyFilterData" (
    "id" SERIAL NOT NULL,
    "companySavedFilterId" INTEGER NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "condition" "Condition" NOT NULL,
    "companyStatus" "CompanyStatus" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyFilterData_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyLocation" (
    "id" SERIAL NOT NULL,
    "addressLine1" TEXT,
    "addressLine2" TEXT,
    "city" TEXT,
    "state" TEXT,
    "zip" TEXT,
    "companyId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyNews" (
    "id" SERIAL NOT NULL,
    "link" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyNews_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanySavedFilter" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanySavedFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanySkills" (
    "id" SERIAL NOT NULL,
    "skillId" INTEGER NOT NULL,
    "companyId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanySkills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanySocialLinks" (
    "id" SERIAL NOT NULL,
    "website" TEXT,
    "portfolio" TEXT,
    "linkedIn" TEXT,
    "twitter" TEXT,
    "facebook" TEXT,
    "instagram" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanySocialLinks_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyValue" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT,
    "companyId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyValue_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Company" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "tagline" TEXT,
    "logo" TEXT,
    "categoryId" INTEGER,
    "socialmediaId" INTEGER,
    "companyCultureDescription" TEXT,
    "companyAboutDescription" TEXT,
    "companyGrowthDescription" TEXT,
    "email" TEXT NOT NULL,
    "contactNumber" TEXT,
    "status" TEXT NOT NULL,
    "country" TEXT,
    "noOfEmployees" TEXT,
    "isShowSalaryChart" BOOLEAN,
    "isShowGrowthInsights" BOOLEAN,
    "website" TEXT,
    "linkedIn" TEXT,
    "twitter" TEXT,
    "facebook" TEXT,
    "instagram" TEXT,
    "accountStatus" "AccountStatus" NOT NULL DEFAULT 'ACTIVE',
    "identificationNumber" INTEGER,
    "gstNumber" INTEGER,
    "businessAddress" TEXT,
    "annualReport" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Company_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CompanyUser" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "fullName" TEXT,
    "password" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    "roleId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CompanyUser_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoreCareers" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "CoreCareers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Currency" (
    "id" SERIAL NOT NULL,
    "country" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "symbol" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Currency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Invitation" (
    "id" SERIAL NOT NULL,
    "email" TEXT,
    "password" TEXT,
    "token" TEXT NOT NULL,
    "companyId" INTEGER NOT NULL,
    "roleId" INTEGER,
    "expiresAt" TIMESTAMP(3),
    "accepted" BOOLEAN DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Invitation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobApplications" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "applicationStatus" "JobApplicationStatus",
    "score" DOUBLE PRECISION,
    "interviewDate" TIMESTAMP(3),
    "screeningMode" "MethodOfApplication",
    "level" "ExpertiseLevel",
    "year" "ExpertiseYear",
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobApplications_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BoostedJob" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER NOT NULL,
    "boostPlanId" INTEGER NOT NULL,
    "selectedLocationId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "validUpto" TIMESTAMP(3) NOT NULL,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "BoostedJob_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobCategory" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER NOT NULL,
    "categoryId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobFilterComparison" (
    "id" SERIAL NOT NULL,
    "filterDataPairNumber" INTEGER NOT NULL,
    "value" "ComparisonCondition" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobFilterComparison_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobKeywords" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER,
    "keywordId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobKeywords_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobLocation" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER NOT NULL,
    "locationId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobLocation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobsLanguage" (
    "id" SERIAL NOT NULL,
    "languageId" INTEGER,
    "jobId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobsLanguage_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobResponsibilites" (
    "id" SERIAL NOT NULL,
    "responsibilitiesId" INTEGER,
    "jobId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobResponsibilites_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobSavedFilter" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobSavedFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobSearchAppearence" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER NOT NULL,
    "appearedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JobSearchAppearence_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobSkills" (
    "id" SERIAL NOT NULL,
    "skillId" INTEGER,
    "jobId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobSkills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobTotalView" (
    "id" SERIAL NOT NULL,
    "jobId" INTEGER,
    "viewedById" INTEGER,
    "viewedByType" TEXT,
    "viewedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "JobTotalView_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Job" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "jobType" "JobType",
    "jobMode" "JobMode",
    "expertiseType" "JobExpertiseType",
    "expertiseLevel" "ExpertiseLevel",
    "yearsOfExperience" "ExpertiseYear",
    "qualification" "JobQualification",
    "jobDescription" TEXT,
    "salaryType" "JobExpectedSalary",
    "expectedSalary" INTEGER,
    "minimumSalary" INTEGER,
    "maximumSalary" INTEGER,
    "email" TEXT,
    "isUrgentHiring" BOOLEAN,
    "hiringMultipleCandidate" INTEGER DEFAULT 1,
    "isExpiryDate" BOOLEAN DEFAULT true,
    "expiryDate" TIMESTAMP(3),
    "methodOfApplication" "MethodOfApplication",
    "assesmentLink" TEXT,
    "companyId" INTEGER,
    "status" "JobStatus" DEFAULT 'ACTIVE',
    "currentPage" INTEGER DEFAULT 0,
    "isPublished" BOOLEAN NOT NULL DEFAULT false,
    "isBoosted" BOOLEAN NOT NULL DEFAULT false,
    "starRating" DOUBLE PRECISION,
    "postedBy" "JobPostedBy",
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Job_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobRoles" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobRoles_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobsFilter" (
    "id" SERIAL NOT NULL,
    "categoryId" INTEGER,
    "condition" "FilterCondition" NOT NULL,
    "jobId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobsFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobRequirements" (
    "id" SERIAL NOT NULL,
    "requirementsId" INTEGER,
    "jobId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobRequirements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "JobScreeningQuestions" (
    "id" SERIAL NOT NULL,
    "screeningQuestionId" INTEGER,
    "jobId" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "JobScreeningQuestions_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Keyword" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Keyword_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Languages" (
    "id" SERIAL NOT NULL,
    "name" TEXT,
    "slug" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Languages_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Location" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Location_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LoginDetail" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "token" TEXT NOT NULL,
    "os" TEXT,
    "location" TEXT,
    "country" TEXT,
    "browser" TEXT,
    "uniqueId" TEXT,
    "expireAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "LoginDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "messageAttachment" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "chatroomId" INTEGER NOT NULL,
    "messageId" INTEGER NOT NULL,
    "fileUrl" TEXT NOT NULL,
    "fileType" TEXT NOT NULL,
    "joinedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "messageAttachment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Message" (
    "id" SERIAL NOT NULL,
    "chatroomId" INTEGER NOT NULL,
    "senderId" INTEGER NOT NULL,
    "receiverId" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "status" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "replyToId" INTEGER,

    CONSTRAINT "Message_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NotificationSettingsCategory" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deleteAt" TIMESTAMP(3),

    CONSTRAINT "NotificationSettingsCategory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NotificationSettings" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "subTitle" TEXT NOT NULL,
    "notificationSettingsCategoryId" INTEGER NOT NULL,
    "isPush" BOOLEAN NOT NULL DEFAULT false,
    "isEmail" BOOLEAN NOT NULL DEFAULT false,
    "isSMS" BOOLEAN NOT NULL DEFAULT false,
    "userId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "NotificationSettings_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Notification" (
    "id" SERIAL NOT NULL,
    "description" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdById" INTEGER NOT NULL,
    "createdByType" "UserTypes" NOT NULL,
    "createdToId" INTEGER NOT NULL,
    "createdToType" "UserTypes" NOT NULL,
    "notificationType" "NotificationType" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Notification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReferralCode" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "status" "ReferralCodeStatus" DEFAULT 'ACTIVE',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "dateModified" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ReferralCode_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReportedCandidateAccounts" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER NOT NULL,
    "reportedCompanyId" INTEGER NOT NULL,
    "reason" TEXT NOT NULL,
    "reportedDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "suspended" BOOLEAN NOT NULL DEFAULT false,
    "issuedWarning" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ReportedCandidateAccounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReportedCompanyAccounts" (
    "id" SERIAL NOT NULL,
    "companyId" INTEGER NOT NULL,
    "reportedCandidateID" INTEGER NOT NULL,
    "reason" TEXT NOT NULL,
    "reportedDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "suspended" BOOLEAN NOT NULL DEFAULT false,
    "issuedWarning" BOOLEAN NOT NULL DEFAULT false,

    CONSTRAINT "ReportedCompanyAccounts_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ReportedHistory" (
    "id" SERIAL NOT NULL,
    "action" TEXT NOT NULL,
    "reportedBy" TEXT NOT NULL,
    "reason" TEXT NOT NULL,
    "dateOfReported" TIMESTAMP(3) NOT NULL,
    "companyHistoryId" INTEGER,
    "candidateHistoryId" INTEGER,

    CONSTRAINT "ReportedHistory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Requirements" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Requirements_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ResetPasswordDetail" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "resetToken" TEXT NOT NULL,
    "otp" TEXT NOT NULL,
    "expireAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ResetPasswordDetail_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Responsibilities" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Responsibilities_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ScreeningQuestion" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "ScreeningQuestion_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Setting" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "unrecognizedLoginAlert" BOOLEAN NOT NULL DEFAULT false,
    "twoFactorAuthentication" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Setting_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Skills" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "slug" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TempToken" (
    "id" SERIAL NOT NULL,
    "token" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),
    "userId" INTEGER NOT NULL,

    CONSTRAINT "TempToken_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User" (
    "id" SERIAL NOT NULL,
    "fullName" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT,
    "phoneNumber" TEXT,
    "dateOfBirth" TEXT,
    "roleIds" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "specialPermissionIds" TEXT[] DEFAULT ARRAY[]::TEXT[],
    "status" BOOLEAN,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserChatRooms" (
    "id" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "chatroomId" INTEGER NOT NULL,
    "joinedAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "UserChatRooms_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Verification" (
    "id" SERIAL NOT NULL,
    "candidateId" INTEGER,
    "companyId" INTEGER,
    "status" "VerificationStatus" DEFAULT 'PENDING',
    "dateRequested" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3),
    "deletedAt" TIMESTAMP(3),

    CONSTRAINT "Verification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "_ApplicationFilterComparisonToApplicationSavedFilter" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_ApplicationFilterDataToApplicationSavedFilter" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_JobFilterComparisonToJobSavedFilter" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateTable
CREATE TABLE "_FilterGroupJobFilters" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "CandidateTransactions_transactionId_key" ON "CandidateTransactions"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyTransactions_transactionId_key" ON "CompanyTransactions"("transactionId");

-- CreateIndex
CREATE UNIQUE INDEX "Invoice_invoiceNo_key" ON "Invoice"("invoiceNo");

-- CreateIndex
CREATE UNIQUE INDEX "BoostPlan_name_key" ON "BoostPlan"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Candidate_email_key" ON "Candidate"("email");

-- CreateIndex
CREATE UNIQUE INDEX "CandidateCoreCareers_careerId_key" ON "CandidateCoreCareers"("careerId");

-- CreateIndex
CREATE UNIQUE INDEX "CandidateJobRoles_jobRoleId_key" ON "CandidateJobRoles"("jobRoleId");

-- CreateIndex
CREATE UNIQUE INDEX "CandidateLanguages_languageId_key" ON "CandidateLanguages"("languageId");

-- CreateIndex
CREATE UNIQUE INDEX "CandidateSocialLinks_candidateId_key" ON "CandidateSocialLinks"("candidateId");

-- CreateIndex
CREATE UNIQUE INDEX "Category_name_key" ON "Category"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Category_slug_key" ON "Category"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Chatroom_lastMessageId_key" ON "Chatroom"("lastMessageId");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyCategory_slug_key" ON "CompanyCategory"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Company_socialmediaId_key" ON "Company"("socialmediaId");

-- CreateIndex
CREATE UNIQUE INDEX "CompanyUser_email_key" ON "CompanyUser"("email");

-- CreateIndex
CREATE UNIQUE INDEX "CoreCareers_slug_key" ON "CoreCareers"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Country_code_key" ON "Country"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Currency_code_key" ON "Currency"("code");

-- CreateIndex
CREATE UNIQUE INDEX "Invitation_email_key" ON "Invitation"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Invitation_token_key" ON "Invitation"("token");

-- CreateIndex
CREATE UNIQUE INDEX "JobRoles_slug_key" ON "JobRoles"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Keyword_slug_key" ON "Keyword"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Languages_slug_key" ON "Languages"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Location_slug_key" ON "Location"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "NotificationSettingsCategory_name_key" ON "NotificationSettingsCategory"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Notification_slug_key" ON "Notification"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Requirements_slug_key" ON "Requirements"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Responsibilities_slug_key" ON "Responsibilities"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Role_name_key" ON "Role"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ScreeningQuestion_slug_key" ON "ScreeningQuestion"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "Skills_slug_key" ON "Skills"("slug");

-- CreateIndex
CREATE UNIQUE INDEX "TempToken_userId_key" ON "TempToken"("userId");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "UserChatRooms_userId_chatroomId_key" ON "UserChatRooms"("userId", "chatroomId");

-- CreateIndex
CREATE UNIQUE INDEX "Verification_candidateId_key" ON "Verification"("candidateId");

-- CreateIndex
CREATE UNIQUE INDEX "Verification_companyId_key" ON "Verification"("companyId");

-- CreateIndex
CREATE UNIQUE INDEX "_ApplicationFilterComparisonToApplicationSavedFilter_AB_unique" ON "_ApplicationFilterComparisonToApplicationSavedFilter"("A", "B");

-- CreateIndex
CREATE INDEX "_ApplicationFilterComparisonToApplicationSavedFilter_B_index" ON "_ApplicationFilterComparisonToApplicationSavedFilter"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_ApplicationFilterDataToApplicationSavedFilter_AB_unique" ON "_ApplicationFilterDataToApplicationSavedFilter"("A", "B");

-- CreateIndex
CREATE INDEX "_ApplicationFilterDataToApplicationSavedFilter_B_index" ON "_ApplicationFilterDataToApplicationSavedFilter"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_JobFilterComparisonToJobSavedFilter_AB_unique" ON "_JobFilterComparisonToJobSavedFilter"("A", "B");

-- CreateIndex
CREATE INDEX "_JobFilterComparisonToJobSavedFilter_B_index" ON "_JobFilterComparisonToJobSavedFilter"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_FilterGroupJobFilters_AB_unique" ON "_FilterGroupJobFilters"("A", "B");

-- CreateIndex
CREATE INDEX "_FilterGroupJobFilters_B_index" ON "_FilterGroupJobFilters"("B");

-- AddForeignKey
ALTER TABLE "ApplicationSavedFilter" ADD CONSTRAINT "ApplicationSavedFilter_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateTransactions" ADD CONSTRAINT "CandidateTransactions_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateTransactions" ADD CONSTRAINT "CandidateTransactions_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyTransactions" ADD CONSTRAINT "CompanyTransactions_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyTransactions" ADD CONSTRAINT "CompanyTransactions_invoiceId_fkey" FOREIGN KEY ("invoiceId") REFERENCES "Invoice"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invoice" ADD CONSTRAINT "Invoice_summaryId_fkey" FOREIGN KEY ("summaryId") REFERENCES "InvoiceSummary"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateFilterComparison" ADD CONSTRAINT "CandidateFilterComparison_candidateSavedFilterId_fkey" FOREIGN KEY ("candidateSavedFilterId") REFERENCES "CandidateSavedFilter"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateFilterData" ADD CONSTRAINT "CandidateFilterData_candidateSavedFilterId_fkey" FOREIGN KEY ("candidateSavedFilterId") REFERENCES "CandidateSavedFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateSavedFilter" ADD CONSTRAINT "CandidateSavedFilter_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateCertifications" ADD CONSTRAINT "CandidateCertifications_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateCoreCareers" ADD CONSTRAINT "CandidateCoreCareers_careerId_fkey" FOREIGN KEY ("careerId") REFERENCES "CoreCareers"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateCoreCareers" ADD CONSTRAINT "CandidateCoreCareers_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateEducation" ADD CONSTRAINT "CandidateEducation_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateFollowing" ADD CONSTRAINT "CandidateFollowing_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateJobRoles" ADD CONSTRAINT "CandidateJobRoles_jobRoleId_fkey" FOREIGN KEY ("jobRoleId") REFERENCES "JobRoles"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateJobRoles" ADD CONSTRAINT "CandidateJobRoles_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateLanguages" ADD CONSTRAINT "CandidateLanguages_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Languages"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateLanguages" ADD CONSTRAINT "CandidateLanguages_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidatePreferredJobLocations" ADD CONSTRAINT "CandidatePreferredJobLocations_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateResumes" ADD CONSTRAINT "CandidateResumes_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateSkills" ADD CONSTRAINT "CandidateSkills_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateSkills" ADD CONSTRAINT "CandidateSkills_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateSocialLinks" ADD CONSTRAINT "CandidateSocialLinks_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CandidateWorkExperience" ADD CONSTRAINT "CandidateWorkExperience_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Chatroom" ADD CONSTRAINT "Chatroom_lastMessageId_fkey" FOREIGN KEY ("lastMessageId") REFERENCES "Message"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyFilterDataComparison" ADD CONSTRAINT "CompanyFilterDataComparison_companySavedFilterId_fkey" FOREIGN KEY ("companySavedFilterId") REFERENCES "CompanySavedFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyFilterData" ADD CONSTRAINT "CompanyFilterData_companySavedFilterId_fkey" FOREIGN KEY ("companySavedFilterId") REFERENCES "CompanySavedFilter"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyLocation" ADD CONSTRAINT "CompanyLocation_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyNews" ADD CONSTRAINT "CompanyNews_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanySavedFilter" ADD CONSTRAINT "CompanySavedFilter_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanySkills" ADD CONSTRAINT "CompanySkills_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanySkills" ADD CONSTRAINT "CompanySkills_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyValue" ADD CONSTRAINT "CompanyValue_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "CompanyCategory"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Company" ADD CONSTRAINT "Company_socialmediaId_fkey" FOREIGN KEY ("socialmediaId") REFERENCES "CompanySocialLinks"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyUser" ADD CONSTRAINT "CompanyUser_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CompanyUser" ADD CONSTRAINT "CompanyUser_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invitation" ADD CONSTRAINT "Invitation_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Invitation" ADD CONSTRAINT "Invitation_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobApplications" ADD CONSTRAINT "JobApplications_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobApplications" ADD CONSTRAINT "JobApplications_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BoostedJob" ADD CONSTRAINT "BoostedJob_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BoostedJob" ADD CONSTRAINT "BoostedJob_boostPlanId_fkey" FOREIGN KEY ("boostPlanId") REFERENCES "BoostPlan"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BoostedJob" ADD CONSTRAINT "BoostedJob_selectedLocationId_fkey" FOREIGN KEY ("selectedLocationId") REFERENCES "Location"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobCategory" ADD CONSTRAINT "JobCategory_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobCategory" ADD CONSTRAINT "JobCategory_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobKeywords" ADD CONSTRAINT "JobKeywords_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobKeywords" ADD CONSTRAINT "JobKeywords_keywordId_fkey" FOREIGN KEY ("keywordId") REFERENCES "Keyword"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobLocation" ADD CONSTRAINT "JobLocation_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobLocation" ADD CONSTRAINT "JobLocation_locationId_fkey" FOREIGN KEY ("locationId") REFERENCES "Location"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobsLanguage" ADD CONSTRAINT "JobsLanguage_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Languages"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobsLanguage" ADD CONSTRAINT "JobsLanguage_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobResponsibilites" ADD CONSTRAINT "JobResponsibilites_responsibilitiesId_fkey" FOREIGN KEY ("responsibilitiesId") REFERENCES "Responsibilities"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobResponsibilites" ADD CONSTRAINT "JobResponsibilites_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSavedFilter" ADD CONSTRAINT "JobSavedFilter_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSearchAppearence" ADD CONSTRAINT "JobSearchAppearence_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSkills" ADD CONSTRAINT "JobSkills_skillId_fkey" FOREIGN KEY ("skillId") REFERENCES "Skills"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobSkills" ADD CONSTRAINT "JobSkills_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobTotalView" ADD CONSTRAINT "JobTotalView_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Job" ADD CONSTRAINT "Job_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobsFilter" ADD CONSTRAINT "JobsFilter_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "Category"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobsFilter" ADD CONSTRAINT "JobsFilter_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobRequirements" ADD CONSTRAINT "JobRequirements_requirementsId_fkey" FOREIGN KEY ("requirementsId") REFERENCES "Requirements"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobRequirements" ADD CONSTRAINT "JobRequirements_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobScreeningQuestions" ADD CONSTRAINT "JobScreeningQuestions_screeningQuestionId_fkey" FOREIGN KEY ("screeningQuestionId") REFERENCES "ScreeningQuestion"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "JobScreeningQuestions" ADD CONSTRAINT "JobScreeningQuestions_jobId_fkey" FOREIGN KEY ("jobId") REFERENCES "Job"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LoginDetail" ADD CONSTRAINT "LoginDetail_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messageAttachment" ADD CONSTRAINT "messageAttachment_messageId_fkey" FOREIGN KEY ("messageId") REFERENCES "Message"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "messageAttachment" ADD CONSTRAINT "messageAttachment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_chatroomId_fkey" FOREIGN KEY ("chatroomId") REFERENCES "Chatroom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_senderId_fkey" FOREIGN KEY ("senderId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Message" ADD CONSTRAINT "Message_replyToId_fkey" FOREIGN KEY ("replyToId") REFERENCES "Message"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationSettings" ADD CONSTRAINT "NotificationSettings_notificationSettingsCategoryId_fkey" FOREIGN KEY ("notificationSettingsCategoryId") REFERENCES "NotificationSettingsCategory"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NotificationSettings" ADD CONSTRAINT "NotificationSettings_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportedCandidateAccounts" ADD CONSTRAINT "ReportedCandidateAccounts_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportedCandidateAccounts" ADD CONSTRAINT "ReportedCandidateAccounts_reportedCompanyId_fkey" FOREIGN KEY ("reportedCompanyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportedCompanyAccounts" ADD CONSTRAINT "ReportedCompanyAccounts_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportedCompanyAccounts" ADD CONSTRAINT "ReportedCompanyAccounts_reportedCandidateID_fkey" FOREIGN KEY ("reportedCandidateID") REFERENCES "Candidate"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportedHistory" ADD CONSTRAINT "ReportedHistory_companyHistoryId_fkey" FOREIGN KEY ("companyHistoryId") REFERENCES "ReportedCompanyAccounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ReportedHistory" ADD CONSTRAINT "ReportedHistory_candidateHistoryId_fkey" FOREIGN KEY ("candidateHistoryId") REFERENCES "ReportedCandidateAccounts"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ResetPasswordDetail" ADD CONSTRAINT "ResetPasswordDetail_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Setting" ADD CONSTRAINT "Setting_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TempToken" ADD CONSTRAINT "TempToken_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserChatRooms" ADD CONSTRAINT "UserChatRooms_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "UserChatRooms" ADD CONSTRAINT "UserChatRooms_chatroomId_fkey" FOREIGN KEY ("chatroomId") REFERENCES "Chatroom"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Verification" ADD CONSTRAINT "Verification_candidateId_fkey" FOREIGN KEY ("candidateId") REFERENCES "Candidate"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Verification" ADD CONSTRAINT "Verification_companyId_fkey" FOREIGN KEY ("companyId") REFERENCES "Company"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationFilterComparisonToApplicationSavedFilter" ADD CONSTRAINT "_ApplicationFilterComparisonToApplicationSavedFilter_A_fkey" FOREIGN KEY ("A") REFERENCES "ApplicationFilterComparison"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationFilterComparisonToApplicationSavedFilter" ADD CONSTRAINT "_ApplicationFilterComparisonToApplicationSavedFilter_B_fkey" FOREIGN KEY ("B") REFERENCES "ApplicationSavedFilter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationFilterDataToApplicationSavedFilter" ADD CONSTRAINT "_ApplicationFilterDataToApplicationSavedFilter_A_fkey" FOREIGN KEY ("A") REFERENCES "ApplicationFilterData"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ApplicationFilterDataToApplicationSavedFilter" ADD CONSTRAINT "_ApplicationFilterDataToApplicationSavedFilter_B_fkey" FOREIGN KEY ("B") REFERENCES "ApplicationSavedFilter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobFilterComparisonToJobSavedFilter" ADD CONSTRAINT "_JobFilterComparisonToJobSavedFilter_A_fkey" FOREIGN KEY ("A") REFERENCES "JobFilterComparison"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_JobFilterComparisonToJobSavedFilter" ADD CONSTRAINT "_JobFilterComparisonToJobSavedFilter_B_fkey" FOREIGN KEY ("B") REFERENCES "JobSavedFilter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilterGroupJobFilters" ADD CONSTRAINT "_FilterGroupJobFilters_A_fkey" FOREIGN KEY ("A") REFERENCES "JobSavedFilter"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_FilterGroupJobFilters" ADD CONSTRAINT "_FilterGroupJobFilters_B_fkey" FOREIGN KEY ("B") REFERENCES "JobsFilter"("id") ON DELETE CASCADE ON UPDATE CASCADE;
