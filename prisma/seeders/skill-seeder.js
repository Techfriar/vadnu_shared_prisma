import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();

/**
 * Function to seed initial skills into the database.
 * Uses the `upsert` method to insert skills if they don't exist,
 * based on the unique slug field, without updating existing records.
 */
export default async function seedSkills() {
  const skills = [
    { name: "Data Analysis", slug: "data-analysis" },
    { name: "SQL", slug: "sql" },
    { name: "Communication", slug: "communication" },
    { name: "Leadership", slug: "leadership" },
    { name: "Problem Solving", slug: "problem-solving" },
    { name: "Python", slug: "python" },
  ];

  try {
    for (const skill of skills) {
      await prisma.skills.upsert({
        where: { slug: skill.slug },
        update: {},
        create: {
          name: skill.name,
          slug: skill.slug,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      });
    }
  } catch (error) {
    console.error("Error seeding skills:", error);
  }
}
