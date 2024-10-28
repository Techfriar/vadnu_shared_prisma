import { PrismaClient } from "@prisma/client";
// Initialize the Prisma Client
const prisma = new PrismaClient();

export default async function seedBoostPlan() {
  const boostPlan = [
    {
      name: "Local",
      duration: 14,
      priceValue: 49.99,
      features: [
        "Boost your job in the right location for hiring",
        "Find the best talent in selected areas, and pay for just that",
      ],
    },
    {
      name: "Basic",
      duration: 7,
      priceValue: 79.99,
      features: [
        `Top placement in search results with a distinctive highlight`,
        `Featured in the "Featured Jobs" section on the homepage`,
        `Increased visibility in job recommendation emails to relevant candidates`,
      ],
    },
    {
      name: "Standard",
      duration: 14,
      priceValue: 99.99,
      features: [
        `Top placement in search results with a distinctive highlight`,
        `Featured in the "Featured Jobs" section on the homepage`,
        `Increased visibility in job recommendation emails to relevant candidates`,
      ],
    },
    {
      name: "Standard",
      duration: 30,
      priceValue: 169.99,
      features: [
        `Top placement in search results with a distinctive highlight`,
        `Featured in the "Featured Jobs" section on the homepage`,
        `Increased visibility in job recommendation emails to relevant candidates`,
      ],
    },
  ];
  try {
    await Promise.all(
      boostPlan.map((plan) =>
        prisma.boostPlan.upsert({
          where: { name: plan.name },
          update: {},
          create: {
            name: plan.name,
            duration: plan.duration,
            priceValue: plan.priceValue,
            features: plan.features,
            createdAt: new Date(),
            updatedAt: new Date(),
          },
        })
      )
    );
  } catch (error) {
    console.log("Error while seeding boost plan:", error);
  }
}
