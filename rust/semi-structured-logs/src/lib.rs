// This stub file contains items which aren't used yet; feel free to remove this module attribute
// to enable stricter warnings.
#![allow(unused)]

/// various log levels
#[derive(Clone, PartialEq, Debug)]
pub enum LogLevel {
    Info,
    Warning,
    Error,
    Debug,
}
/// primary function for emitting logs
pub fn log(level: LogLevel, message: &str) -> String {
    let readable_level = match level {
        LogLevel::Error => "ERROR",
        LogLevel::Warning => "WARNING",
        LogLevel::Info => "INFO",
        LogLevel::Debug => "DEBUG",
    };

    format!("[{}]: {}", readable_level, message)
}

pub fn debug(message: &str) -> String {
    log(LogLevel::Debug, message)
}

pub fn info(message: &str) -> String {
    log(LogLevel::Info, message)
}

pub fn warn(message: &str) -> String {
    log(LogLevel::Warning, message)
}

pub fn error(message: &str) -> String {
    log(LogLevel::Error, message)
}
