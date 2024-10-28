import seedBoostPlan from "./boost-seeder.js";
import seedCompanyCategory from "./company-category-seeder.js";
import seedCountries from "./country-seeder.js";
import seedCurrencies from "./currency-seeder.js";
import seedSkills from "./skill-seeder.js";
import seedSettingsNotificationCategory from "./settings-notification-category-seeder.js";
import seedCategory from "./job-category-seeder.js";
import seedKeyword from "./keyword-seeder.js";
import seedLanguage from "./language-seeder.js";
import seedLocation from "./location.js";
import seedSkill from "./skills-seeder.js";

export default async function runAllSeeders() {
  try {
    // Execute the company category seeder
    await seedCompanyCategory();
    await seedCountries();
    await seedCurrencies();
    await seedCategory();
    await seedSkill();
    await seedKeyword();
    await seedLocation();
    await seedLanguage();
    await seedBoostPlan();
    await seedSkills();
    await seedSettingsNotificationCategory();
  } catch (error) {
    console.error(error);
  }
}
