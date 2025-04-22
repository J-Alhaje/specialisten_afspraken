<?php

namespace App\Controller;

use App\Entity\Appointment;
use App\Form\AppointmentType;
use App\Repository\AppointmentRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class SpecialistController extends AbstractController
{
    #[Route('/specialist', name: 'app_specialist_home')]
    public function index(AppointmentRepository $appointmentRepository): Response
    {
        $user = $this->getUser();
        $appointments = $appointmentRepository->findBy(['specialist' => $user]);

        return $this->render('specialist/index.html.twig', [
            'appointments' => $appointments,
        ]);
    }

    #[Route('/specialist/appointment', name: 'app_appointment_new')]
    public function new(Request $request, EntityManagerInterface $entityManager): Response
    {
        $appointment = new Appointment();
        $appointment->setSpecialist($this->getUser());
        
        $form = $this->createForm(AppointmentType::class, $appointment);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $entityManager->persist($appointment);
            $entityManager->flush();
            $this->addFlash("success", "Afspraak succesvol toegevoegd");
            return $this->redirectToRoute('app_specialist_home');
        }

        return $this->render('specialist/new.html.twig', [
            'form' => $form,
        ]);
    }
}
