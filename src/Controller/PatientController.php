<?php

namespace App\Controller;

use App\Repository\AppointmentRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class PatientController extends AbstractController
{
    #[Route('/patient', name: 'app_patient_home')]
    public function index(AppointmentRepository $appointmentRepository): Response
    {
        $user = $this->getUser();
        $appointments = $appointmentRepository->findBy(['patient' => $user]);

        return $this->render('patient/index.html.twig', [
            'appointments' => $appointments,
        ]);
    }
}
