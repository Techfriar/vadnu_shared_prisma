import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function seedCategory() {
  const categories = [
    { name: "Electrical", slug: "electrical" },
    { name: "Electronics", slug: "electronics" },
    { name: "Mechanical", slug: "mechanical" },
    { name: "Power Systems", slug: "power-systems" },
    { name: "Control Systems", slug: "control-systems" },
    { name: "Telee communication", slug: "telee-communication" },
    { name: "Design", slug: "design" },
  ];
  try {
    for (const category of categories) {
      await prisma.category.upsert({
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
    console.error(error);
    console.error("Error seeding job categry");
  }
}
