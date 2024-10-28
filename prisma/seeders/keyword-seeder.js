import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function seedKeyword() {
  const keywords = [
    { name: "Electronics", slug: "electronics" },
    { name: "Problem-solving", slug: "problem-solving" },
  ];
  try {
    for (const keyword of keywords) {
      await prisma.keyword.upsert({
        where: { slug: keyword.slug },
        update: {},
        create: {
          name: keyword.name,
          slug: keyword.slug,
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
