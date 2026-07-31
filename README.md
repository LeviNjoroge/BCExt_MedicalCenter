# MedicalCentreMS

![Build Status](https://img.shields.io/badge/build-passing-brightgreen)
![AL Runtime](https://img.shields.io/badge/AL%20runtime-17.0-blue)
![License](https://img.shields.io/badge/license-Proprietary-lightgrey)

## Overview

MedicalCentreMS is a Microsoft Dynamics 365 Business Central extension for managing a medical center workflow end to end. It supports patient registration, visit creation, clinical assessments, allergy tracking, staff and role setup, laboratory and radiology catalogues, prescriptions and diagnosis, and visit-based billing.

The extension is designed to help front-office and clinical teams capture patient data once, process it through the care journey, and keep billing and visit status information aligned inside Business Central.

## Key Features

- Patient registration and master data capture, including identification, contacts, next of kin, and insurance details.
- Visit creation and visit lifecycle tracking with status, payment status, admission, discharge, balance, and billed amount.
- Assessment and triage support for recording patient assessments and advancing the visit workflow.
- Allergy management with allergy categories, severity, and status tracking.
- Staff and role administration for core health staff records and staff role definitions.
- Laboratory, radiology, and procedure catalogues for clinical service pricing and selection.
- Medicines, prescriptions, and diagnosis lists for clinical treatment and dispensing workflows.
- Billing line capture for consultation, laboratory, imaging, procedure, and pharmacy charges.
- Billing history review for operational and finance follow-up.
- Automated patient and visit email notifications using Business Central email capabilities.

## Prerequisites

| Requirement | Value |
| --- | --- |
| Target Business Central application | 28.0.0.0 |
| AL runtime | 17.0 |
| Publisher | Levi |
| Extension version | 1.0.0.0 |
| Dependencies | None declared in [app.json](app.json) |

Additional setup requirements:

- A Business Central environment that supports AL runtime 17.0.
- A configured Business Central email account if you want patient registration and visit notifications to be sent successfully.
- Standard number series setup for patient, staff, visit, assessment, and consultation numbering.

No custom APIs, external portal integrations, or third-party service dependencies were found in the scanned source.

## Installation

1. Open the extension project in Visual Studio Code.
2. Restore or validate symbols if needed, then package the app with `AL: Package`.
3. Publish the extension with `AL: Publish` to your target Business Central environment.
4. If you prefer PowerShell-based deployment, build the `.app` package and publish it with your standard Business Central extension deployment workflow.
5. After publishing, open the setup page and configure the required number series and fees before allowing users to transact.

Example AL workflow:

```text
AL: Package
AL: Publish
```

## Configuration & Setup

Complete the setup in [Medical Center Setup Page](src/Setup/Pag99900.MCSetupPage.al) backed by [Setup](src/Setup/Tab99900.Setup.al).

| Setup field | Purpose |
| --- | --- |
| Patient ID | Number series used for patient numbers |
| Staff ID | Number series used for staff numbers |
| Visit ID | Number series used for visit numbers |
| Assessments No Series | Number series used for assessment records |
| Consultations No. Series | Number series used for consultation records |
| Consultation Fee | Default consultation charge used by billing |

Recommended initial setup steps:

1. Create the required No. Series records in Business Central.
2. Assign each series on the Medical Center Setup Page.
3. Enter the consultation fee.
4. Seed supporting master data such as staff roles, allergies, medicines, diagnosis codes, laboratory test types, radiology items, and procedures.
5. Confirm email account settings so notification emails can be delivered.

## Usage / Workflows

Typical operational flow:

1. Open [Patients Registration Card](src/Pages/Pag99901.PatientsRegistrationCard.al) and capture the patient application details.
2. Use the submit action to create the patient record in [Patients Table](src/Tables/Tab99902.PatientsTable.al) and send the welcome email.
3. Create a visit from the patient record or visit page and let the system assign the next visit number.
4. Move the visit through assessment and consultation using [Visit Card](src/Pages/Pag99904.VisitCard.al) and the assessment/consultation pages.
5. Add charges through billing lines for consultation, laboratory, imaging, procedure, or pharmacy items.
6. Review the calculated balance on the visit and clear the patient once the balance is zero.

Example outcome:

- Patient is registered.
- Visit is created and marked for assessment.
- Billing lines are added automatically or manually according to the service used.
- The visit remains open until payment is cleared.

## Developer Notes

| Area | Reference |
| --- | --- |
| Patient registration helper | [Cod99900.PatientRegistrationHelper.al](src/Codeunits/Cod99900.PatientRegistrationHelper.al) |
| Notification helper | [Cod99901.SendNotifications.al](src/Codeunits/Cod99901.SendNotifications.al) |
| Billing helper | [Cod99902.BillingHelper.al](src/Codeunits/Cod99902.BillingHelper.al) |
| Process helper | [Cod99903.ProcessesHelper.al](src/Codeunits/Cod99903.ProcessesHelper.al) |
| Visit table | [Tab99909.VisitTable.al](src/Tables/Tab99909.VisitTable.al) |
| Setup table | [Tab99900.Setup.al](src/Setup/Tab99900.Setup.al) |
| Setup page | [Pag99900.MCSetupPage.al](src/Setup/Pag99900.MCSetupPage.al) |

Notable implementation points:

- Patient registration copies data from the application record into the patient master record.
- Visit creation assigns the visit number from the configured number series and initializes the visit status.
- Billing helpers insert one charge line per service type and prevent duplicate lines for the same visit and item.
- Visit balance is derived from billed amount minus amount paid.

Current source scan notes:

- No custom permission sets were found.
- No API pages were found.
- No reports were found.

## Support & Contributions

Please report issues with a clear reproduction path, the affected page or codeunit, and the Business Central version you are using.

For contributions, keep changes focused, aligned with the existing AL patterns, and accompanied by validation in a supported Business Central environment.

## License

Copyright (c) 2026 Levi.

This repository does not currently declare a separate open-source license file. Treat the extension as proprietary unless a formal license is added later.