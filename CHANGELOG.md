[Release Notes](https://docs.usercentrics.com/cmp_in_app_sdk/latest/about/history/)

# 2.2.1

## Features

- [NEW Banner API 🎉] A complete revamp of our banner API will enable you to have high customisation and versatility to build a end-user friendly consent banner. We can't wait for you to give it a try. For more details, see: Presenting the Banner.
    - Add a Header Image to your banner.
    - Have full control over the layour of your action buttons with Column, Row or Grid configurations.
    - Launch the second layer directly.
    - Landscape Mode support.
    - You can now add a "More Information" link to your banner message to forward users to the 2nd Layer. Appearance > Settings > More Information Link in Banner Message. Then you will be able to add this link in the banner message text editor.
- [Usability] Collect consent only at a category level. Option available in your Admin Interface: Configure > Legal Specifications > Settings > Category Consent.
- [CNIL] "Continue wthout Accepting" feature is now supported. (French regulation)
- [Fonts] Admin Interface fonts are now deprecated for App. To enable custom fonts, please inject the font via banner API.

## Improvements

- [API] Expose user's consent history.
- [TCF 2.0] Adding support to actively inform users when vendors are sharing data outside a region.
- [CCPA] Improve API to facilitate compliance with new Banner API.

## Resolved Issues
- [TCF 2.0] Minor design upgrades to improve usability.
- [iOS] Edge case with RestoreUserSession failing is now solved.
- [iOS] Issue with local and remote images losing quality is now solved.
- UI/UX improvements and fixes.

# 2.0.3

- Minor fix on UI related to consent toggles.
- Corner radius on iOS.

# 2.0.2

- Custom UI API.

# 2.0.1

- Initial version of the library.
