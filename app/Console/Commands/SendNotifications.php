<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Carbon\Carbon;

use App\Appointment;

class SendNotifications extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'fcm:send';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Enviar mensajes via FCM';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return mixed
     */
    public function handle()
    {
        $this->info('Buscando citas confirmadas en las proximas 24 horas.');
        //01 December -> 02 December (No: 03 December)
        // 3 pm

        //hora actual
        //2022-12-01 14:00:00

        $now = Carbon::now();

        // scheduled_date 2022-12-02
        // scheduled_time 15:00:00

        $appointmentsTomorrow = $this->getAppointments24Hours($now);

        foreach ($appointmentsTomorrow as $appointment) {
            $appointments->patient->sendFCM('No olvides tu cita mañana a esta hora.');
            $this->info('Mensaje FCM enviado al paciente (ID): ' . $appointment->patient_id);
        }

        $appointmentsNextHour = $this->getAppointmentsNextHour($now);
        
        foreach ($appointmentsNextHour as $appointment) {
            $appointments->patient->sendFCM('Tienes una cita en 1 hora. Te esperamos.');
        }
    }

    private function getAppointments24Hours($now)
    {
        return Appointment::where('status', 'Confirmada')
            ->where('scheduled_date', $now->addDay()->toDateString())
            ->where('scheduled_time', '>=', $now->copy()->subMinutes(3)->toTimeString())
            ->where('scheduled_time', '<', $now->copy()->addMinutes(2)->toTimeString())
            ->get(['id', 'scheduled_date', 'scheduled_time', 'patient_id'])
            ->toArray();
    }

    private function getAppointmentsNextHour($now)
    {
        return Appointment::where('status', 'Confirmada')
            ->where('scheduled_date', $now->addHour()->toDateString())
            ->where('scheduled_time', '>=', $now->copy()->subMinutes(3)->toTimeString())
            ->where('scheduled_time', '<', $now->copy()->addMinutes(2)->toTimeString())
            ->get(['id', 'scheduled_date', 'scheduled_time', 'patient_id'])
            ->toArray();
    }
}
