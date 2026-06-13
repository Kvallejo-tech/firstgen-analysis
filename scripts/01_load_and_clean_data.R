# ============================================================================
# STEP 1: Load and Clean Data
# ============================================================================
# This script loads your 4 CSV files and transforms them for analysis
# The data has first-gen status in rows and outcomes in columns with percentages

library(tidyverse)
library(readr)

# ============================================================================
# PART 1: Load the raw CSV files
# ============================================================================

# These files contain comparison data between first-gen and
# non-first-gen students
gpa_data <- read_csv("../data/firstgen_gpa.csv")
graduation_data <- read_csv("../data/firstgen_graduation.csv")
income_data <- read_csv("../data/firstgen_income.csv")
retention_data <- read_csv("../data/firstgen_retention.csv")

# ============================================================================
# PART 2: View the raw data structure
# ============================================================================

cat("\n=== GPA DISTRIBUTION ===\n")
print(gpa_data)

cat("\n=== GRADUATION OUTCOMES ===\n")
print(graduation_data)

cat("\n=== INCOME DISTRIBUTION ===\n")
print(income_data)

cat("\n=== RETENTION/ENROLLMENT ===\n")
print(retention_data)

# ============================================================================
# PART 3: Transform data from wide to long format
# ============================================================================
# Why? Long format is better for visualization and statistical analysis
# It converts: firstgen_percentage | nonfirstgen_percentage
# Into: student_type | percentage (one row per combination)

gpa_long <- gpa_data %>%
  pivot_longer(
    cols = c(firstgen_percentage, nonfirstgen_percentage),
    names_to = "student_type",
    values_to = "percentage"
  ) %>%
  mutate(
    student_type = case_when(
      student_type == "firstgen_percentage" ~ "First-Generation",
      student_type == "nonfirstgen_percentage" ~ "Non-First-Generation"
    ),
    gpa_range = str_replace_all(gpa_range, "_", "-")
  )

graduation_long <- graduation_data %>%
  pivot_longer(
    cols = c(firstgen_percentage, nonfirstgen_percentage),
    names_to = "student_type",
    values_to = "percentage"
  ) %>%
  mutate(
    student_type = case_when(
      student_type == "firstgen_percentage" ~ "First-Generation",
      student_type == "nonfirstgen_percentage" ~ "Non-First-Generation"
    ),
    outcome = str_replace_all(outcome, "_", " ")
  )

income_long <- income_data %>%
  pivot_longer(
    cols = c(firstgen_percentage, nonfirstgen_percentage),
    names_to = "student_type",
    values_to = "percentage"
  ) %>%
  mutate(
    student_type = case_when(
      student_type == "firstgen_percentage" ~ "First-Generation",
      student_type == "nonfirstgen_percentage" ~ "Non-First-Generation"
    ),
    income_category = str_replace_all(income_category, "_", " ")
  )

retention_long <- retention_data %>%
  pivot_longer(
    cols = c(firstgen_percentage, nonfirstgen_percentage),
    names_to = "student_type",
    values_to = "percentage"
  ) %>%
  mutate(
    student_type = case_when(
      student_type == "firstgen_percentage" ~ "First-Generation",
      student_type == "nonfirstgen_percentage" ~ "Non-First-Generation"
    ),
    enrollment_status = str_replace_all(enrollment_status, "_", " ")
  )

# ============================================================================
# PART 4: View transformed data
# ============================================================================

cat("\n=== GPA DATA (LONG FORMAT) ===\n")
print(gpa_long)

# ============================================================================
# PART 5: Save cleaned data for next scripts
# ============================================================================

saveRDS(gpa_long, "../output/gpa_long.rds")
saveRDS(graduation_long, "../output/graduation_long.rds")
saveRDS(income_long, "../output/income_long.rds")
saveRDS(retention_long, "../output/retention_long.rds")

cat("\n✓ Data cleaned and saved successfully!\n")
