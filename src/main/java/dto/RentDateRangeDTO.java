package dto;

import java.time.LocalDate;

public class RentDateRangeDTO {
    private LocalDate dateStart;
    private LocalDate dateEnd;

    public RentDateRangeDTO() {
    }

    public RentDateRangeDTO(LocalDate dateStart, LocalDate dateEnd) {
        this.dateStart = dateStart;
        this.dateEnd = dateEnd;
    }

    public LocalDate getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(LocalDate dateEnd) {
        this.dateEnd = dateEnd;
    }

    public LocalDate getDateStart() {
        return dateStart;
    }

    public void setDateStart(LocalDate dateStart) {
        this.dateStart = dateStart;
    }
}
