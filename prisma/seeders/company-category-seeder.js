import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

/**
 * Seeds company categories into the database.
 *
 * This function is intended to be run during development, to ensure that the
 * categories are available in the database. It will upsert the categories, so it is
 * safe to run multiple times.
 *
 * @returns {Promise<void>} Resolves when the seeding is complete.
 */
export default async function seedCompanyCategory() {
  const categories = [
    { name: "Mechanical", slug: "mechanical" },
    { name: "Electrical", slug: "electrical" },
    { name: "Civil", slug: "civil" },
    { name: "Chemical", slug: "chemical" },
    { name: "Computer", slug: "computer" },
    { name: "Aerospace", slug: "aerospace" },
    { name: "Biomedical", slug: "biomedical" },
    { name: "Industrial", slug: "industrial" },
    { name: "Environmental", slug: "environmental" },
    { name: "Materials", slug: "materials" },
  ];

  try {
    for (const category of categories) {
      await prisma.companyCategory.upsert({
        where: { slug: category.slug },
        update: {},
        create: {
          name: category.name,
          slug: category.slug,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      });
    }
  } catch (error) {
    console.error("Error seeding company categories:", error);
  }
}
