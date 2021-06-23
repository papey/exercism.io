type Students = Map<string, string>;
type Roster = Map<string, string[]>;

export default class GradeSchool {
  private readonly students: Students = new Map();

  constructor() {
    this.students = new Map();
  }

  addStudent(name: string, grade: number): void {
    this.students.set(name, grade.toString());
  }

  studentRoster(): Roster {
    const roster: Roster = new Map();
    this.students.forEach((grade, student) => {
      roster.get(grade)?.push(student) ?? roster.set(grade, [student]);
    });

    roster.forEach((group) => group.sort());
    return roster;
  }

  studentsInGrade(grade: number | string): string[] {
    return this.studentRoster().get(grade.toString()) ?? [];
  }
}
