#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    use CalculatorInput::*;
    let mut stack: Vec<i32> = Vec::new();

    for input in inputs {
        match input {
            Value(val) => stack.push(*val),
            Add => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a + b);
            }
            Subtract => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a - b);
            }
            Multiply => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a * b)
            }
            Divide => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a / b);
            }
        }
    }

    if stack.len() != 1 {
        return None;
    }

    Some(stack.pop().unwrap())
}

pub fn pop_operands(stack: &mut Vec<i32>) -> Option<(i32, i32)> {
    let o1 = stack.pop()?;
    let o2 = stack.pop()?;
    Some((o2, o1))
}
