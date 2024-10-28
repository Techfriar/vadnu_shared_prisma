import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export default async function seedLanguage() {
  const languages = [
    { name: "Mandarin Chinese", slug: "mandarin-chinese" },
    { name: "Spanish", slug: "spanish" },
    { name: "English", slug: "english" },
    { name: "Hindi", slug: "hindi" },
    { name: "Bengali", slug: "bengali" },
    { name: "Portuguese", slug: "portuguese" },
    { name: "Russian", slug: "russian" },
    { name: "Japanese", slug: "japanese" },
    { name: "Western Punjabi", slug: "western-punjabi" },
    { name: "Marathi", slug: "marathi" },
    { name: "Telugu", slug: "telugu" },
    { name: "Wu Chinese", slug: "wu-chinese" },
    { name: "Turkish", slug: "turkish" },
    { name: "Korean", slug: "korean" },
    { name: "French", slug: "french" },
    { name: "German", slug: "german" },
    { name: "Vietnamese", slug: "vietnamese" },
    { name: "Tamil", slug: "tamil" },
    { name: "Urdu", slug: "urdu" },
    { name: "Javanese", slug: "javanese" },
    { name: "Italian", slug: "italian" },
    { name: "Persian", slug: "persian" },
    { name: "Gujarati", slug: "gujarati" },
    { name: "Polish", slug: "polish" },
    { name: "Ukrainian", slug: "ukrainian" },
    { name: "Romanian", slug: "romanian" },
    { name: "Dutch", slug: "dutch" },
    { name: "Greek", slug: "greek" },
    { name: "Czech", slug: "czech" },
    { name: "Swedish", slug: "swedish" },
    { name: "Hungarian", slug: "hungarian" },
    { name: "Finnish", slug: "finnish" },
    { name: "Hebrew", slug: "hebrew" },
    { name: "Burmese", slug: "burmese" },
    { name: "Khmer", slug: "khmer" },
    { name: "Lao", slug: "lao" },
    { name: "Thai", slug: "thai" },
    { name: "Malay", slug: "malay" },
    { name: "Swahili", slug: "swahili" },
    { name: "Hausa", slug: "hausa" },
    { name: "Yoruba", slug: "yoruba" },
    { name: "Zulu", slug: "zulu" },
    { name: "Amharic", slug: "amharic" },
    { name: "Somali", slug: "somali" },
    { name: "Shona", slug: "shona" },
    { name: "Afrikaans", slug: "afrikaans" },
    { name: "Nepali", slug: "nepali" },
    { name: "Pashto", slug: "pashto" },
    { name: "Dari", slug: "dari" },
    { name: "Sinhala", slug: "sinhala" },
    { name: "Burmese", slug: "burmese" },
    { name: "Armenian", slug: "armenian" },
    { name: "Georgian", slug: "georgian" },
    { name: "Azerbaijani", slug: "azerbaijani" },
    { name: "Kazakh", slug: "kazakh" },
    { name: "Uzbek", slug: "uzbek" },
    { name: "Turkmen", slug: "turkmen" },
    { name: "Tajik", slug: "tajik" },
    { name: "Kyrgyz", slug: "kyrgyz" },
  ];
  try {
    for (const language of languages) {
      await prisma.languages.upsert({
        where: { slug: language.slug },
        update: {},
        create: {
          name: language.name,
          slug: language.slug,
          createdAt: new Date(),
          updatedAt: new Date(),
        },
      });
    }
  } catch (error) {
    console.error(error);
    console.error("Error seeding Language");
  }
}
