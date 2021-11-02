#[derive(Debug)]
pub enum CalculatorInput {
    Add,
    Subtract,
    Multiply,
    Divide,
    Value(i32),
}

pub fn evaluate(inputs: &[CalculatorInput]) -> Option<i32> {
    if inputs.len() == 0 {
        return None;
    }

    let mut stack: Vec<i32> = Vec::new();

    for input in inputs {
        match input {
            CalculatorInput::Value(val) => stack.push(*val),
            CalculatorInput::Add => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a + b);
            }
            CalculatorInput::Subtract => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a - b);
            }
            CalculatorInput::Multiply => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a * b)
            }
            CalculatorInput::Divide => {
                let (a, b) = pop_operands(&mut stack)?;
                stack.push(a / b);
            }
        }
    }

    if stack.len() != 1 {
        return None;
    }

    return Some(stack.pop().unwrap());
}

pub fn pop_operands(stack: &mut Vec<i32>) -> Option<(i32, i32)> {
    let o1 = stack.pop()?;
    let o2 = stack.pop()?;
    return Some((o2, o1));
}
