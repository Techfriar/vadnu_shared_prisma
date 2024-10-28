import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function seedSkill() {
  const jobs = [
    { name: "Leadership", slug: "leadership" },
    { name: "Problem-solving", slug: "problem-solving" },
  ];
  try {
    for (const job of jobs) {
      await prisma.skills.upsert({
        where: { slug: job.slug },
        update: {},
        create: {
          name: job.name,
          slug: job.slug,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      });
    }
  } catch (error) {
    console.error(error);
    console.error("Error seeding skills");
  }
}
