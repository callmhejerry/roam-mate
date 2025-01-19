# PROJECT FEATURE



## Phase 1: Core Features (Foundation)
### 1. Authentication System (for both Student and Landlord Apps)
-  User registration and login (email, phone, password).
-  Role-based access (Student vs. Landlord).
-  2FA (optional for added security).

### 2. Basic Student App (Search & Listings)
- Search Functionality:
- Basic search by location, rent price, room type (shared, self-contained).
- Property Listing Display:
    Show properties with essential details like description, price, and images.
- Filters:
    Implement basic filters for price, location, and room type.
- Property Details Page:
    Display detailed information on individual properties.

### 3. Basic Landlord App (Listing Management)
- Add/Edit Property Listings:
    Allow landlords to create and manage property listings with details (price, location, amenities).
- Image Upload:
    Implement image upload functionality for property pictures.

### 4. Backend Setup (Serverpod)
- User Authentication:
    Implement Serverpod’s user authentication system.
- Database Models:
    Set up basic models for users, properties, and roles.
- API Endpoints for Listings:
    Create backend APIs to handle the creation, retrieval, and deletion of listings.


## Phase 2: Intermediate Features (Building out core functionality)
### 1. Student Roommate Matching
- Student Profile Creation:
    Allow students to create profiles and set preferences (budget, preferred room type, etc.).
- Matching Algorithm:
    Implement logic to suggest potential roommates based on preferences.

### 2. Advanced Property Features (Student App)
- Sorting & Filters Enhancements:
    Implement more advanced filters like distance from campus, availability, etc.
- Map View:
    Display properties on a map for better navigation.

### 3. Landlord Features (Advanced)
- Document Upload for Verification:
    Allow landlords to upload documents (proof of ownership, etc.) for verification.
- Property Status:
    Track whether the property is approved, pending, or rejected by the admin.

### 4. Admin Web Dashboard (Basic)
- Admin Login and Role-based Access:
    Admins should be able to access a web dashboard.
- View and Approve Listings:
    Admins can review listings and approve/reject them based on verification.



## Phase 3: Advanced Features (Enhancing User Experience & Functionality)
### 1. In-App Messaging (Student and Landlord Apps)
- Messaging System:
    Enable students to message landlords (and vice versa) for inquiries about properties or roommates.
- Real-time Notifications:
    Use push notifications to notify users about new messages, inquiries, or responses.

### 2. Student Reviews and Ratings
- Property Reviews:
    Allow students to review properties they’ve stayed in.
- Landlord Reviews:
    Allow students to review landlords to provide feedback on their experience.

### 3. Admin Web Dashboard (Advanced)
- Listing Verification and Moderation:
    Allow admins to review and approve listings submitted by landlords.
- User Management:
    Admins can view student and landlord profiles, block/report users.
- Analytics & Reporting:
    Provide insights into user engagement, popular listings, and trends.

### 4. Push Notifications for Students (Advanced)
- New Listings Alerts:
    Notify students when new listings matching their preferences are posted.
- Roommate Matching Notifications:
    Notify students when a potential roommate match is found.



## Phase 4: Polishing & Final Enhancements
### 1. UX/UI Improvements
- Design Tweaks:
    Improve app aesthetics and user flow based on feedback.
- Responsive Design for Web Admin:
    Ensure the admin dashboard works smoothly on different screen sizes (desktop, tablet, mobile).

### 2. Security & Performance
- Data Encryption:
    Ensure sensitive data (documents, messages) is securely encrypted.
- Backend Optimization:
    Optimize the backend to handle increased traffic and large datasets (listings, profiles).

### 3. Final Testing and Debugging
- QA and Bug Fixes:
    Test all features and fix any bugs or issues.
- User Testing:
    Conduct user testing (both students and landlords) to ensure all features are intuitive.



## Phase 5: Deployment and Maintenance
### 1. App Deployment (Mobile)
- Launch the Student and Landlord apps on the respective app stores (Google Play, Apple App Store).

### 2. Backend Deployment
- Set up a production environment for Serverpod and deploy the backend.

### 3. Ongoing Maintenance & Feature Updates
- Address user feedback:
    Continuously improve the app based on user suggestions and issues.
- Future Features:
    Plan for additional features such as integrated payment systems, advanced filtering, or AI-based property suggestions.
