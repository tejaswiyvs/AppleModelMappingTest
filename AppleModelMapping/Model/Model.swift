//
//  Encounter.swift
//  AppleModelMappingTest
//
//  Created by Tejaswi Yerukalapudi on 7/29/15.
//  Copyright © 2015 MCH. All rights reserved.
//

import UIKit

class AppointmentSearchResult : NSObject {
    var DoctorId: NSString?
    var FirstName: NSString?
    var LastName: NSString?
    var Rate: Int?
    var DoctorAvailability: [Availability]?
}

class Availability : NSObject {
    var AvailabilityId: NSString?
    var StartDateTime: NSString?
    var EndDateTime: NSString?
    var Status: NSString?
}

class Doctor: NSObject {
    var DoctorId: String?
    var FirstName: String?
    var LastName: String?
    var specialty: [Specialty]?
}

class Specialty: NSObject {
    var SpecialtyId: String?
    var SpecialtyName: String?
}

class Address: NSObject {
    var Address1: String?
    var Address2: String?
    var City: String?
    var Zip: String?
}

class Person: NSObject {
    var PersonId: String?
    var UserId: String?
    var FirstName: String?
    var LastName: String?
}


class Encounter: NSObject {
    var EncounterId: String?
    var PersonId: String?
    var DoctorId: String?
    var CSRId: String?
    var AddressId: String?
    var IsPersonReady: String?
    var IsDoctorReady: String?
    var IsCSRReady: String?
    var AssignedToDoctorId: String?
    var Room: String?
    var Status: String?
    var Weight: String?
    var Height: String?
    var DoctorRatePct: String?
    var AppointmentDetailId: String?
    var StartDate: String?
    var EndDate: String?
    var CsrStartDate: String?
    var QueueStartDate: String?
    var QueueEndDate: String?
    var DurationMinutes: String?
    var ScheduleDate: String?
    var DateCreated: String?
    var Symptoms: String?
    var OtherSymptoms: String?
    var Allergies: String?
    var MedicalHistory: String?
    var Notes: String?
    var ReasonForVisit: String?
    var PaymentToken: String?
    var TotalCharge: String?
    var IsMchEmployee: String?
    var ProcessCharge: String?
    var GroupCode: String?
    var LastUpdatedDate: String?
    var AvailabilityId: String?
    var person: Person?
    var doctor: Doctor?
    var address: Address?
}

