<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Interfaces\ScheduleServiceInterface;

use App\WorkDay;
use Carbon\Carbon;

class ScheduleController extends Controller
{
    public function hours(Request $request, ScheduleServiceInterface $scheduleService)
    {
        $rules = [
            'date' => 'required|date_format:"Y-m-d"',
            'doctor_id' => 'required|exists:users,id'
        ];
        $this->validate($request, $rules);

        $date = $request->input('date');
        $dateCarbon = new Carbon($date);

        // dayofweek
        // Carbon: 0 (sunday) - 6 (saturday)
        // WorkDay: 0 (monday) - 6 (sunday)
        $i = $dateCarbon->dayOfWeek;
        $day = ($i==0 ? 6 : $i-1);

        $doctorId = $request->input('doctor_id');

        $workDay = WorkDay::where('active', true)
            ->where('day', $day)
            ->where('user_id', $doctorId)
            ->first([
                'morning_start', 'morning_end',
                'afternoon_start', 'afternoon_end'
            ]);

        if (!$workDay) {
            return [];
        }

        $morningIntervals = $this->getIntervals(
            $workDay->morning_start, $workDay->morning_end
        );

        $afternoonIntervals = $this->getIntervals(
            $workDay->afternoon_start, $workDay->afternoon_end
        );

        $data = [];
        $data['morning'] = $morningIntervals;
        $data['afternoon'] = $afternoonIntervals;
        return $data;
        
    }

    private function getIntervals($start, $end){
        $start = new Carbon($start);
        $end = new Carbon($end);

        $intervals = [];
        while($start < $end) {
            $interval = [];

            $interval['start'] = $start->format('g:i A');
            $start->addMinutes(30);
            $interval['end'] = $start->format('g:i A');

            $intervals []= $interval;
        }

        return $intervals;
    }

}
