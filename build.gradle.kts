plugins {
    id("java")
}

group = "com.ippo-pescaria"
version = "1.0-SNAPSHOT"

repositories {
    mavenCentral()
}

dependencies {
    // Compilation
    compileOnly("jakarta.servlet:jakarta.servlet-api:6.0.0")
    // Dependencies
    implementation("de.mkammerer:argon2-jvm:2.11")

    // Testing
    testImplementation("org.junit.jupiter:junit-jupiter:5.11.2")

//    runtimeOnly("javax.servlet:javax.servlet-api:4.0.1")
}

tasks.test {
    useJUnitPlatform()

//    testLogging.showStandardStreams=true
}

// TODO: Resolve sourceSets to organize the tests folders
//sourceSets {
//    named("test") {
//        java {
//            setSrcDirs(listOf("test", "test/java", "test/java/Unit"))
//        }
//    }
//}