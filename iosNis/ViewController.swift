//
//  ViewController.swift
//  iosNis
//
//  Created by Alibek Adhamov on 15/09/23.
//
import UIKit
final class Student {
    var grades: [Double] = []
    var fullName: String

    init(grades: [Double] = [], fullName: String) {
        self.grades = grades
        self.fullName = fullName
    }

    func getGrade() -> Double {
        var sum = 0.0

        for grade in grades {
            sum += grade
        }

        return sum / Double(grades.count)
    }
}

final class IOSNis {
    static var students: [Student] = []
    static func getMaxAverage() -> Double{
    var maxMark = 0.0
    for student in students{
    maxMark = max(student.getGrade(), maxMark)
    }
            return maxMark
        }
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(normalizeGrades())
    }
    
    
    func normalizeGrades() -> [String: Double] {
        IOSNis.students = [
            Student(grades: [3.51, 10, 9], fullName: "Ушакова Ангелина"),
            Student(grades: [7, 8, 7.5], fullName: "Алибек Адхамов")
        ]
        var averageGrades: Dictionary<String, Double> = [:]
        var maxAverage = IOSNis.getMaxAverage()
        for student in IOSNis.students{
            averageGrades[student.fullName] = (student.getGrade() / maxAverage) * 10
            
        }
        return averageGrades
    }
}

