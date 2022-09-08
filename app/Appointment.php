<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Carbon\Carbon;

class Appointment extends Model
{
    protected $fillable = [
        'description',
        'specialty_id',
        'doctor_id',
        'patient_id',
        'scheduled_date',
        'scheduled_time',
        'type'
    ];

    // $appointment->specialty
    public function specialty()
    {
        return $this->belongsTo(Specialty::class);
    }

    // $appointment-<>doctor
    public function doctor()
    {
        return $this->belongsTo(User::class);
    }

    // $appointment->patient
    public function patient()
    {
        return $this->belongsTo(Specialty::class);
    }

    // Appointment hasOne 1 - 1/10 belongsTo CancelledAppointment
    // $appointment.>cancel->justification
    public function cancellation()
    {
        return $this->hasOne(CancelledAppointment::class);
    }

    // accesos
    // $appointemnts
    public function getScheduledTime12Attribute() {
        return (new Carbon($this->scheduled_time))
        ->format('g:i A');
    }
}
