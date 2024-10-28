import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

/**
 * Function to seed initial settings notification categories into the database.
 * Uses the `upsert` method to insert categories if they don't exist,
 * based on the unique `name` field, without updating existing records.
 */
export default async function seedSettingsNotificationCategory() {
  const datas = [
    {
      name: "Delete account requests",
    },
    {
      name: "Account reports",
    },
    {
      name: "Support request/contact request sent",
    },
    {
      name: "Admin actions",
    },
    {
      name: "Unrecognized log-ins",
    },
  ];

  try {
    for (const data of datas) {
      await prisma.notificationSettingsCategory.upsert({
        where: { name: data.name },
        update: {},
        create: {
          name: data.name,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      });
    }
  } catch (error) {
    console.log("Error seeding settings notification type:", error);
  }
}
